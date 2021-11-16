import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_display_config/lib/core_display_config.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/src/entities/event_data/deck_event_data.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/feature_speed_duel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_result.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_animation_handler.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_event.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart';

import 'helpers/speed_duel_event_emitter.dart';
import 'models/player_state.dart';
import 'models/zone_type.dart';
import 'usecases/create_play_card_use_case.dart';
import 'usecases/create_player_state_use_case.dart';
import 'usecases/does_card_fit_in_zone_use_case.dart';

@Injectable()
class SpeedDuelViewModel extends BaseViewModel {
  static const _tag = 'SpeedDuelViewModel';

  static const _speedDuelStartHandLength = 4;

  late final DuelRoom? _duelRoom;
  final AppRouter _router;
  final SmartDuelServer _smartDuelServer;
  final CreatePlayerStateUseCase _createPlayerStateUseCase;
  final CreatePlayCardUseCase _createPlayCardUseCase;
  final DoesCardFitInZoneUseCase _doesCardFitInZoneUseCase;
  final CanCardAttackZoneUseCase _canCardAttackZoneUseCase;
  final MoveCardUseCase _moveCardUseCase;
  final SpeedDuelEventEmitter _speedDuelEventEmitter;
  final SpeedDuelEventAnimationHandler _speedDuelEventAnimationHandler;
  final DataManager _dataManager;
  final CrashlyticsProvider _crashlyticsProvider;
  final SnackBarService _snackBarService;
  final DisplayConfigService _displayConfigService;

  final _duelState = BehaviorSubject<SpeedDuelState>();

  final _screenState = BehaviorSubject<SpeedDuelScreenState>.seeded(const SpeedDuelLoading());
  Stream<SpeedDuelScreenState> get screenState => _screenState.stream;

  final _screenEvent = BehaviorSubject<SpeedDuelScreenEvent>();
  Stream<SpeedDuelScreenEvent> get screenEvent => _screenEvent.stream;

  StreamSubscription<SpeedDuelState>? _speedDuelStateSubscription;
  StreamSubscription<SmartDuelEvent>? _smartDuelEventSubscription;

  bool _initialized = false;
  bool _duelOver = false;

  SpeedDuelViewModel(
    @factoryParam this._duelRoom,
    this._router,
    this._smartDuelServer,
    this._createPlayerStateUseCase,
    this._createPlayCardUseCase,
    this._doesCardFitInZoneUseCase,
    this._canCardAttackZoneUseCase,
    this._moveCardUseCase,
    this._speedDuelEventEmitter,
    this._speedDuelEventAnimationHandler,
    this._dataManager,
    this._crashlyticsProvider,
    this._snackBarService,
    this._displayConfigService,
    Logger logger,
  ) : super(logger);

  //region Lifecycle

  bool onBackPressed() {
    logger.info(_tag, 'onBackPressed()');

    final canPop = _duelOver || _screenState.value is! SpeedDuelData;
    if (!canPop) {
      _snackBarService.showSnackBar('Currently, the back key cannot be used.');
    }

    return canPop;
  }

  //endregion

  //region Initialization

  Future<void> init() async {
    logger.info(_tag, '_init()');

    await _displayConfigService.useDuelMode();

    try {
      _initSpeedDuelStateSubscription();

      await _setDeck();
      _shuffleDeck();
      _drawStartHand();

      _initSmartDuelEventSubscription();

      _screenState.safeAdd(SpeedDuelData(_duelState.value));
      _initialized = true;
    } catch (e, stackTrace) {
      _crashlyticsProvider.logException(e, stackTrace);
      _screenState.safeAdd(const SpeedDuelError());
    }
  }

  void _initSpeedDuelStateSubscription() {
    logger.verbose(_tag, '_initSpeedDuelStateSubscription()');

    _speedDuelStateSubscription = _duelState.listen((state) {
      if (_initialized && _screenState.value is SpeedDuelData) {
        _screenState.safeAdd(SpeedDuelData(state));
      }
    });
  }

  Future<void> _setDeck() async {
    logger.verbose(_tag, '_setDeck()');

    final duelistId = _smartDuelServer.getDuelistId();

    final user = _duelRoom!.duelists.firstWhere((duelist) => duelist.id == duelistId);
    final userState = await _createPlayerStateUseCase(user);

    final opponent = _duelRoom!.duelists.firstWhere((duelist) => duelist.id != duelistId);
    final opponentState = await _createPlayerStateUseCase(opponent, isOpponent: true);

    _duelState.safeAdd(
      SpeedDuelState(
        userState: userState,
        opponentState: opponentState,
      ),
    );
  }

  void _drawStartHand() {
    logger.verbose(_tag, '_drawStartHand()');

    for (var i = 0; i < _speedDuelStartHandLength; i++) {
      _drawCard();
    }
  }

  void _initSmartDuelEventSubscription() {
    logger.verbose(_tag, '_initSmartDuelEventSubscription()');

    _smartDuelEventSubscription = Rx.merge([
      _smartDuelServer.cardEvents,
      _smartDuelServer.deckEvents,
      _smartDuelServer.roomEvents,
      _smartDuelServer.globalEvents,
    ]).listen(_onSmartDuelEventReceived);
  }

  //endregion

  //region Drag & drop

  bool onWillZoneAcceptCard(PlayCard card, Zone zone) {
    logger.info(_tag, 'onWillZoneAcceptCard(card: ${card.yugiohCard.id}, zone: ${zone.zoneType})');

    _screenEvent.safeAdd(const SpeedDuelHideOverlaysEvent());

    final userState = _duelState.value.userState;
    return userState.duelistId == zone.duelistId
        ? _doesCardFitInZoneUseCase(card, zone, userState)
        : _canCardAttackZoneUseCase(card, zone, userState.duelistId);
  }

  Future<void> onZoneAcceptsCard(PlayCard card, Zone zone) async {
    logger.info(_tag, 'onZoneAcceptsCard(card: ${card.yugiohCard.id}, zone: ${zone.zoneType})');

    _screenEvent.safeAdd(const SpeedDuelHideOverlaysEvent());

    final userState = _duelState.value.userState;

    if (userState.duelistId != zone.duelistId) {
      _onMonsterAttack(card, zone);
      return;
    }

    if (zone.zoneType.isMultiCardZone && zone.zoneType == ZoneType.deck) {
      await _onDeckZoneAcceptsCard(card, zone);
      return;
    }

    bool movedCard = false;
    if (zone.zoneType.isMultiCardZone) {
      movedCard = _moveCardToNewZone(card, zone, CardPosition.faceUp);
    } else {
      final result = await _router.showPlayCardDialog(card, newZone: zone, showActions: true);
      if (result is PlayCardUpdatePosition) {
        movedCard = _moveCardToNewZone(card, zone, result.position);
      }
    }

    // Shuffle when a card is moved from the deck to somewhere else
    if (movedCard && card.zoneType == ZoneType.deck) {
      _shuffleDeck();
    }
  }

  void _onMonsterAttack(PlayCard attackingCard, Zone targettedZone) {
    logger.verbose(
      _tag,
      '_onMonsterAttack(attackingCard: ${attackingCard.yugiohCard.id}, zone: ${targettedZone.zoneType})',
    );

    _speedDuelEventEmitter.sendAttackCardEvent(attackingCard, targettedZone.zoneType);
    _speedDuelEventAnimationHandler.onAttackCardEvent(attackingCard, targettedZone);
  }

  Future<void> _onDeckZoneAcceptsCard(PlayCard card, Zone deckZone) async {
    logger.verbose(_tag, '_onDeckZoneAcceptsCard(card: ${card.yugiohCard.id}, deckZone: ${deckZone.zoneType})');

    final result = await _router.showAddCardToDeckDialog(card);
    if (result == null) {
      return;
    }

    final moveToTop = result is AddToTopOfDeck;
    final movedCard = _moveCardToNewZone(card, deckZone, CardPosition.faceUp, moveToTop: moveToTop);

    if (movedCard && result.shuffle) {
      _shuffleDeck();
    }
  }

  bool _moveCardToNewZone(PlayCard card, Zone newZone, CardPosition position, {bool moveToTop = true}) {
    logger.verbose(
      _tag,
      '_moveCardToNewZone(card: ${card.yugiohCard.id}, zone: ${newZone.zoneType}, position: $position, moveToTop: $moveToTop)',
    );

    if (card.zoneType == newZone.zoneType) {
      return false;
    }

    final userState = _duelState.value.userState;
    final updatedUserState = _moveCardUseCase(userState, card, position, newZone: newZone, moveToTop: moveToTop);
    if (userState == updatedUserState) {
      return false;
    }

    _speedDuelEventEmitter.sendPlayCardEvent(card, newZone.zoneType, position);
    _duelState.safeAdd(_duelState.value.copyWith(userState: updatedUserState));

    return true;
  }

  //endregion

  //region Deck actions

  Iterable<DeckAction> getDeckActions() {
    logger.info(_tag, 'getDeckActions()');

    return _dataManager.getDeckActions();
  }

  void onDeckPressed() {
    logger.info(_tag, 'onDeckPressed()');

    _screenEvent.safeAdd(const SpeedDuelHideOverlaysEvent());
  }

  Future<void> onDeckActionSelected(DeckAction deckAction) {
    logger.info(_tag, 'onDeckActionSelected($deckAction)');

    _screenEvent.safeAdd(const SpeedDuelHideOverlaysEvent());

    switch (deckAction.runtimeType) {
      case DrawCard:
        return _showDrawCard();
      case ShowDeckList:
        return Future.sync(_showDeckList);
      case ShuffleDeck:
        return Future.sync(_shuffleDeck);
      case Surrender:
        return _surrender();
      case SummonToken:
        return _summonToken();
      default:
        return Future.value();
    }
  }

  Future<void> _showDrawCard() async {
    logger.verbose(_tag, '_showDrawCard()');

    await _router.showDrawCard(_drawCard);
  }

  void _showDeckList() {
    logger.verbose(_tag, '_showDeckList()');

    final userState = _duelState.value.userState;
    onMultiCardZonePressed(userState, userState.deckZone);
  }

  void _drawCard() {
    logger.verbose(_tag, '_drawCard()');

    final userState = _duelState.value.userState;
    final deckZone = userState.deckZone;

    final deck = deckZone.cards.toList();
    if (deck.isEmpty) {
      _snackBarService.showSnackBar('Deck is empty');
      return;
    }

    final drawnCard = deck.removeLast().copyWith(zoneType: ZoneType.hand);

    _speedDuelEventEmitter.sendPlayCardEvent(drawnCard, ZoneType.hand, CardPosition.faceUp);

    final updatedUserState = userState.copyWith(
      deckZone: userState.deckZone.copyWith(cards: deck),
      hand: userState.hand.copyWith(cards: [...userState.hand.cards, drawnCard]),
    );

    _duelState.safeAdd(_duelState.value.copyWith(userState: updatedUserState));
  }

  void _shuffleDeck() {
    logger.verbose(_tag, '_shuffleDeck()');

    final userState = _duelState.value.userState;
    final shuffledDeck = userState.deckZone.cards.toList()..shuffle();
    final updatedUserState = userState.copyWith(
      deckZone: userState.deckZone.copyWith(cards: shuffledDeck),
    );

    _duelState.safeAdd(_duelState.value.copyWith(userState: updatedUserState));

    _speedDuelEventEmitter.sendShuffleDeckEvent();
    _speedDuelEventAnimationHandler.onShuffleDeckEvent(_smartDuelServer.getDuelistId()!);
  }

  Future<void> _surrender() async {
    logger.verbose(_tag, '_surrender()');

    final surrender = await _router.showDialog(
      const DialogConfig(
        title: 'Surrender',
        description: 'Are you sure you want to surrender?',
        positiveButtonText: 'Yes',
        negativeButtonText: 'Cancel',
      ),
    );

    if (surrender ?? false) {
      _duelOver = true;
      _speedDuelEventEmitter.sendSurrenderEvent(_duelRoom!);
    }
  }

  Future<void> _summonToken() async {
    logger.verbose(_tag, '_summonToken()');

    final userState = _duelState.value.userState;
    final availableZones = userState.mainMonsterZones.where((zone) => zone.isEmpty);
    if (availableZones.isEmpty) {
      _snackBarService.showSnackBar('You need an empty main monster zone to summon a token.');
      return;
    }

    final token = await _dataManager.getToken();
    final tokenCount = userState.cards.where((card) => card!.yugiohCard.id == token.id).length;
    final tokenCard = _createPlayCardUseCase(token, userState.duelistId, tokenCount + 1);
    return onZoneAcceptsCard(tokenCard, availableZones.first);
  }

  //endregion

  //region Card pressed events

  Future<void> onCardPressed(PlayCard card) async {
    logger.info(_tag, 'onCardPressed(card: $card)');

    if (card.duelistId == _smartDuelServer.getDuelistId()) {
      await _handleUserCardPressed(card);
    } else {
      await _handleOpponentCardPressed(card);
    }
  }

  Future<void> _handleUserCardPressed(PlayCard card) async {
    logger.verbose(_tag, '_handleUserCardPressed(card: $card)');

    final result = await _router.showPlayCardDialog(card, showActions: true);
    if (result == null) {
      return;
    }

    if (result is PlayCardUpdatePosition) {
      _updateCardPosition(card, result.position);
    } else if (result is PlayCardDeclare) {
      _onCardDeclaration(card);
    } else if (result is PlayCardAddCounter || result is PlayCardRemoveCounter) {
      _updateCardCounter(card, result);
    } else if (result is PlayCardReveal || result is PlayCardHide) {
      _updateCardVisibility(card, result);
    }
  }

  void _updateCardPosition(PlayCard card, CardPosition position) {
    logger.verbose(_tag, '_updateCardPosition(card: $card, position: $position)');

    final userState = _duelState.value.userState;
    final updatedUserState = _moveCardUseCase(userState, card, position);
    if (userState == updatedUserState) {
      return;
    }

    if (position == CardPosition.destroy) {
      _speedDuelEventEmitter.sendRemoveCardEvent(card);
    } else {
      _speedDuelEventEmitter.sendPlayCardEvent(card, card.zoneType, position);
    }

    _duelState.safeAdd(_duelState.value.copyWith(userState: updatedUserState));
  }

  void _updateCardCounter(PlayCard card, PlayCardDialogResult result) {
    logger.verbose(_tag, '_updateCardCounter(card: $card, result: $result)');

    final addCounter = result is PlayCardAddCounter;

    final oldState = _duelState.value.userState;
    final oldZone = oldState.getZoneWithCard(card);

    final updatedCard = addCounter ? card.copyAndAddCounter() : card.copyAndRemoveCounter();
    final updatedZone = oldZone.copyWith(cards: [...oldZone.cards, updatedCard]..remove(card));
    final updatedZones = oldState.zones.toList()
      ..remove(oldZone)
      ..add(updatedZone);
    final updatedState = oldState.copyWithAllZones(updatedZones);

    _duelState.safeAdd(
      _duelState.value.copyWith(userState: updatedState),
    );

    addCounter
        ? _speedDuelEventEmitter.sendAddCounterToCardEvent(card)
        : _speedDuelEventEmitter.sendRemoveCounterFromCardEvent(card);
  }

  void _updateCardVisibility(PlayCard card, PlayCardDialogResult result) {
    logger.verbose(_tag, '_updateCardVisibility(card: $card, result: $result)');

    final revealed = result is PlayCardReveal;

    final oldState = _duelState.value.userState;
    final oldZone = oldState.getZoneWithCard(card);
    final oldCardIndex = oldZone.cards.toList().indexOf(card);

    final updatedCard = card.copyWith(revealed: revealed);
    final updatedZone = oldZone.copyWith(
      cards: oldZone.cards.toList()
        ..remove(card)
        ..insert(oldCardIndex, updatedCard),
    );
    final updatedZones = oldState.zones.toList()
      ..remove(oldZone)
      ..add(updatedZone);
    final updatedState = oldState.copyWithAllZones(updatedZones);

    _duelState.safeAdd(
      _duelState.value.copyWith(userState: updatedState),
    );

    revealed
        ? _speedDuelEventEmitter.sendRevealCardEvent(card)
        : _speedDuelEventEmitter.sendHideCardEvent(card);
  }

  void _onCardDeclaration(PlayCard card) {
    logger.verbose(_tag, '_onCardDeclaration(card= $card)');

    _speedDuelEventEmitter.sendDeclareCardEvent(card);
    _speedDuelEventAnimationHandler.onDeclareCardEvent(card);
  }

  Future<void> _handleOpponentCardPressed(PlayCard card) async {
    logger.verbose(_tag, '_handleOpponentCardPressed(card: $card)');

    if (card.position.isFaceDown || (card.zoneType == ZoneType.hand && !card.revealed)) {
      return;
    }

    await _router.showPlayCardDialog(card);
  }

  void onMultiCardZonePressed(PlayerState playerState, Zone zone) {
    logger.info(_tag, 'onMultiCardZonePressed()');

    if (zone.cards.isEmpty) {
      return;
    }

    _screenEvent.safeAdd(SpeedDuelInspectCardPileEvent(playerState, zone));
  }

  //endregion

  //region Receive smart duel events

  Future<void> _onSmartDuelEventReceived(SmartDuelEvent event) async {
    logger.verbose(_tag, '_onSmartDuelEventReceived(event: $event)');

    if (event.scope == SmartDuelEventConstants.cardScope) {
      await _handleCardEvent(event);
      return;
    }

    if (event.scope == SmartDuelEventConstants.deckScope) {
      await _handleDeckEvent(event);
      return;
    }

    if (event.scope == SmartDuelEventConstants.roomScope) {
      await _handleRoomEvent(event);
      return;
    }

    if (event.scope == SmartDuelEventConstants.globalScope) {
      await _handleGlobalEvent(event);
      return;
    }
  }

  //region Handle card events

  Future<void> _handleCardEvent(SmartDuelEvent event) async {
    logger.verbose(_tag, '_handleCardEvent(event: $event)');

    final eventData = event.data;
    if (eventData is CardEventData) {
      switch (event.action) {
        case SmartDuelEventConstants.cardPlayAction:
          await _handlePlayCardEvent(eventData);
          break;
        case SmartDuelEventConstants.cardRemoveAction:
          await _handleRemoveCardEvent(eventData);
          break;
        case SmartDuelEventConstants.cardAttackAction:
          await _handleAttackCardEvent(eventData);
          break;
        case SmartDuelEventConstants.cardDeclareAction:
          await _handleDeclareCardEvent(eventData);
          break;
        case SmartDuelEventConstants.cardAddCounterAction:
          await _handleCardCounterEvent(eventData, addCounter: true);
          break;
        case SmartDuelEventConstants.cardRemoveCounterAction:
          await _handleCardCounterEvent(eventData, addCounter: false);
          break;
        case SmartDuelEventConstants.cardRevealAction:
          await _handleCardVisibilityEvent(eventData, revealed: true);
          break;
        case SmartDuelEventConstants.cardHideAction:
          await _handleCardVisibilityEvent(eventData, revealed: false);
          break;
      }
    }
  }

  Future<void> _handlePlayCardEvent(CardEventData data) async {
    logger.verbose(_tag, '_handlePlayCardEvent(data: $data)');

    final cardId = data.cardId;
    final copyNumber = data.copyNumber;
    final zoneType = parseZoneType(data.zoneName);
    final position = parseCardPosition(data.cardPosition);
    if (zoneType == null || position == null) {
      return;
    }

    final opponentState = _duelState.value.opponentState;

    PlayCard? playCard = opponentState.cards
        .firstWhere((card) => card!.yugiohCard.id == cardId && card.copyNumber == copyNumber, orElse: () => null);

    if (playCard == null) {
      final token = await _dataManager.getToken();
      if (cardId != token.id) {
        throw Exception('Card with ID $cardId was played, but is not in the decklist and is not a token');
      }

      final tokenCount = opponentState.cards.where((card) => card!.yugiohCard.id == token.id).length;
      playCard = _createPlayCardUseCase(token, opponentState.duelistId, tokenCount + 1);
    }

    final newZone = opponentState.zones.firstWhere((zone) => zone.zoneType == zoneType);

    final updatedOpponentState = _moveCardUseCase(opponentState, playCard, position, newZone: newZone);
    if (opponentState == updatedOpponentState) {
      return;
    }

    _duelState.safeAdd(_duelState.value.copyWith(opponentState: updatedOpponentState));
  }

  Future<void> _handleRemoveCardEvent(CardEventData data) async {
    logger.verbose(_tag, '_handleRemoveCardEvent(data: $data)');

    final cardId = data.cardId;
    final copyNumber = data.copyNumber;

    final opponentState = _duelState.value.opponentState;

    final playCard =
        opponentState.cards.firstWhere((card) => card!.yugiohCard.id == cardId && card.copyNumber == copyNumber);

    final updatedOpponentState = _moveCardUseCase(opponentState, playCard!, CardPosition.destroy);
    if (opponentState == updatedOpponentState) {
      return;
    }

    _duelState.safeAdd(_duelState.value.copyWith(opponentState: updatedOpponentState));
  }

  Future<void> _handleAttackCardEvent(CardEventData data) async {
    logger.verbose(_tag, '_handleAttackCardEvent(data: $data)');

    final cardId = data.cardId;
    final copyNumber = data.copyNumber;
    final zoneType = parseZoneType(data.zoneName);
    if (zoneType == null) {
      return;
    }

    final duelState = _duelState.value;
    final attackingCard = duelState.opponentState.cards
        .firstWhere((card) => card?.yugiohCard.id == cardId && card?.copyNumber == copyNumber, orElse: () => null);
    final targetZone = duelState.userState.getZone(zoneType);

    if (attackingCard != null) {
      await _speedDuelEventAnimationHandler.onAttackCardEvent(attackingCard, targetZone);
    }
  }

  Future<void> _handleDeclareCardEvent(CardEventData data) async {
    logger.verbose(_tag, '_handleDeclareCardEvent(data: $data)');

    final cardId = data.cardId;
    final copyNumber = data.copyNumber;

    final declaringCard = _duelState.value.opponentState.cards
        .firstWhere((card) => card?.yugiohCard.id == cardId && card?.copyNumber == copyNumber, orElse: () => null);

    if (declaringCard != null) {
      await _speedDuelEventAnimationHandler.onDeclareCardEvent(declaringCard);
    }
  }

  Future<void> _handleCardCounterEvent(CardEventData data, {required bool addCounter}) async {
    logger.verbose(_tag, '_handleCardCounterEvent(data: $data, addCounter: $addCounter)');

    final cardId = data.cardId;
    final copyNumber = data.copyNumber;

    final playCard = _duelState.value.opponentState.cards
        .firstWhere((card) => card?.yugiohCard.id == cardId && card?.copyNumber == copyNumber, orElse: () => null);
    if (playCard == null) {
      return;
    }

    final oldState = _duelState.value.opponentState;
    final oldZone = oldState.getZoneWithCard(playCard);

    final updatedCard = addCounter ? playCard.copyAndAddCounter() : playCard.copyAndRemoveCounter();
    final updatedZone = oldZone.copyWith(cards: [...oldZone.cards, updatedCard]..remove(playCard));
    final updatedZones = oldState.zones.toList()
      ..remove(oldZone)
      ..add(updatedZone);
    final updatedState = oldState.copyWithAllZones(updatedZones);

    _duelState.safeAdd(
      _duelState.value.copyWith(opponentState: updatedState),
    );
  }

  Future<void> _handleCardVisibilityEvent(CardEventData data, {required bool revealed}) async {
    logger.verbose(_tag, '_handleCardVisibilityEvent(data: $data, revealed: $revealed)');

    final cardId = data.cardId;
    final copyNumber = data.copyNumber;

    final playCard = _duelState.value.opponentState.cards
        .firstWhere((card) => card?.yugiohCard.id == cardId && card?.copyNumber == copyNumber, orElse: () => null);
    if (playCard == null) {
      return;
    }

    final oldState = _duelState.value.opponentState;
    final oldZone = oldState.getZoneWithCard(playCard);
    final oldCardIndex = oldZone.cards.toList().indexOf(playCard);

    final updatedCard = playCard.copyWith(revealed: revealed);
    final updatedZone = oldZone.copyWith(
      cards: oldZone.cards.toList()
        ..remove(playCard)
        ..insert(oldCardIndex, updatedCard),
    );
    final updatedZones = oldState.zones.toList()
      ..remove(oldZone)
      ..add(updatedZone);
    final updatedState = oldState.copyWithAllZones(updatedZones);

    _duelState.safeAdd(
      _duelState.value.copyWith(opponentState: updatedState),
    );
  }

  //endregion

  //region Deck events

  Future<void> _handleDeckEvent(SmartDuelEvent event) async {
    logger.verbose(_tag, '_handleDeckEvent(event: $event)');

    final eventData = event.data;
    if (eventData is DeckEventData) {
      switch (event.action) {
        case SmartDuelEventConstants.deckShuffleAction:
          _handleShuffleDeckEvent(eventData);
          break;
      }
    }
  }

  void _handleShuffleDeckEvent(DeckEventData data) {
    logger.verbose(_tag, '_handleShuffleDeckEvent(data: $data)');

    _speedDuelEventAnimationHandler.onShuffleDeckEvent(data.duelistId);
  }

  //endregion

  //region Room events

  Future<void> _handleRoomEvent(SmartDuelEvent event) async {
    logger.verbose(_tag, '_handleRoomEvent(event: $event)');

    final eventData = event.data;
    if (eventData is RoomEventData) {
      switch (event.action) {
        case SmartDuelEventConstants.roomCloseAction:
          await _handleCloseRoomEvent(eventData);
          break;
      }
    }
  }

  Future<void> _handleCloseRoomEvent(RoomEventData data) async {
    logger.verbose(_tag, '_handleCloseRoomEvent(data: $data)');

    _duelOver = true;

    final winnerId = data.winnerId;
    if (winnerId == null) {
      return;
    }

    final userWon = _smartDuelServer.getDuelistId() == winnerId;
    final description = userWon
        ? 'Your opponent admitted defeat. You won the duel!'
        : 'You admitted defeat. Your opponent won the duel!';

    await _showDuelIsOverDialog(description);
    await _router.closeScreen();
  }

  Future<void> _showDuelIsOverDialog(String description) {
    logger.verbose(_tag, '_showDuelIsOverDialog(description: $description)');

    return _router.showDialog(
      DialogConfig(
        title: 'Duel is over',
        description: description,
        positiveButtonText: 'Continue',
        isDismissable: false,
      ),
    );
  }

  //endregion

  //region Global events

  Future<void> _handleGlobalEvent(SmartDuelEvent event) async {
    logger.verbose(_tag, '_handleGlobalEvent(event: $event)');

    switch (event.action) {
      case SmartDuelEventConstants.globalReconnectAction:
      case SmartDuelEventConstants.globalDisconnectAction:
        await _handleDisconnectEvent();
        break;
    }
  }

  Future<void> _handleDisconnectEvent() async {
    if (_duelOver) {
      return;
    }

    _duelOver = true;
    await _showDuelIsOverDialog('The connection to the Smart Duel Server has been lost.');
    await _router.closeScreen();
  }

  //endregion

  //endregion

  //region Clean-up

  @override
  Future<void> dispose() async {
    logger.info(_tag, 'dispose()');

    await _displayConfigService.useDefaultMode();

    _cancelSpeedDuelStateSubscription();
    _cancelSmartDuelEventSubscription();

    _smartDuelServer.dispose();

    await _duelState.close();
    await _screenState.close();
    await _screenEvent.close();

    super.dispose();
  }

  void _cancelSpeedDuelStateSubscription() {
    logger.verbose(_tag, '_cancelSpeedDuelStateSubscription()');

    _speedDuelStateSubscription?.cancel();
    _speedDuelStateSubscription = null;
  }

  void _cancelSmartDuelEventSubscription() {
    logger.verbose(_tag, '_cancelSmartDuelEventSubscription()');

    _smartDuelEventSubscription?.cancel();
    _smartDuelEventSubscription = null;
  }

  //endregion
}
