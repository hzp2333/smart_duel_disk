import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_event.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart';

import 'models/player_state.dart';
import 'models/zone_type.dart';
import 'usecases/create_play_card_use_case.dart';
import 'usecases/create_player_state_use_case.dart';
import 'usecases/does_card_fit_in_zone_use_case.dart';

@Injectable()
class SpeedDuelViewModel extends BaseViewModel {
  static const _tag = 'SpeedDuelViewModel';

  static const _speedDuelStartHandLength = 4;

  final DuelRoom _duelRoom;
  final AppRouter _router;
  final SmartDuelServer _smartDuelServer;
  final CreatePlayerStateUseCase _createPlayerStateUseCase;
  final CreatePlayCardUseCase _createPlayCardUseCase;
  final DoesCardFitInZoneUseCase _doesCardFitInZoneUseCase;
  final CanCardAttackZoneUseCase _canCardAttackZoneUseCase;
  final MoveCardUseCase _moveCardUseCase;
  final DataManager _dataManager;
  final EnumHelper _enumHelper;
  final CrashlyticsProvider _crashlyticsProvider;
  final SnackBarService _snackBarService;

  final _duelState = BehaviorSubject<SpeedDuelState>();

  final _screenState = BehaviorSubject<SpeedDuelScreenState>.seeded(const SpeedDuelLoading());
  Stream<SpeedDuelScreenState> get screenState => _screenState.stream;

  final _screenEvent = BehaviorSubject<SpeedDuelScreenEvent>();
  Stream<SpeedDuelScreenEvent> get screenEvent => _screenEvent.stream;

  StreamSubscription<SpeedDuelState> _speedDuelStateSubscription;
  StreamSubscription<SmartDuelEvent> _smartDuelEventSubscription;

  bool _initialized = false;
  bool _duelOver = false;

  SpeedDuelViewModel(
    Logger logger,
    @factoryParam this._duelRoom,
    this._router,
    this._smartDuelServer,
    this._createPlayerStateUseCase,
    this._createPlayCardUseCase,
    this._doesCardFitInZoneUseCase,
    this._canCardAttackZoneUseCase,
    this._moveCardUseCase,
    this._dataManager,
    this._enumHelper,
    this._crashlyticsProvider,
    this._snackBarService,
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

    try {
      _initSpeedDuelStateSubscription();

      await _setDeck();
      _shuffleDeck();
      _drawStartHand();

      _initSmartDuelEventSubscription();

      _screenState.add(SpeedDuelData(_duelState.value));
      _initialized = true;
    } catch (e, stackTrace) {
      _crashlyticsProvider.logException(e, stackTrace);
      _screenState.add(const SpeedDuelError());
    }
  }

  void _initSpeedDuelStateSubscription() {
    logger.verbose(_tag, '_initSpeedDuelStateSubscription()');

    _speedDuelStateSubscription = _duelState.listen((state) {
      if (_initialized && _screenState.value is SpeedDuelData) {
        _screenState.add(SpeedDuelData(state));
      }
    });
  }

  Future<void> _setDeck() async {
    logger.verbose(_tag, '_setDeck()');

    final duelistId = _smartDuelServer.getDuelistId();

    final user = _duelRoom.duelists.firstWhere((duelist) => duelist.id == duelistId);
    final userState = await _createPlayerStateUseCase(user);

    final opponent = _duelRoom.duelists.firstWhere((duelist) => duelist.id != duelistId);
    final opponentState = await _createPlayerStateUseCase(opponent, isOpponent: true);

    _duelState.add(SpeedDuelState(
      userState: userState,
      opponentState: opponentState,
    ));
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
      _smartDuelServer.roomEvents,
      _smartDuelServer.globalEvents,
    ]).listen(_onSmartDuelEventReceived);
  }

  //endregion

  //region Drag & drop

  bool onWillZoneAcceptCard(PlayCard card, Zone zone) {
    logger.info(_tag, 'onWillZoneAcceptCard($card, $zone)');

    _screenEvent.add(const SpeedDuelHideOverlaysEvent());

    final userState = _duelState.value.userState;

    if (userState.duelistId == zone.duelistId) {
      return _doesCardFitInZoneUseCase(card, zone, userState);
    }

    return _canCardAttackZoneUseCase(card, zone, userState.duelistId);
  }

  Future<void> onZoneAcceptsCard(PlayCard card, Zone zone) async {
    logger.info(_tag, 'onZoneAcceptsCard(card: $card, zone: $zone)');

    _screenEvent.add(const SpeedDuelHideOverlaysEvent());

    final userState = _duelState.value.userState;

    if (_canCardAttackZoneUseCase(card, zone, userState.duelistId)) {
      _onMonsterAttack(card, zone);
      return;
    }

    if (zone.zoneType.isMultiCardZone) {
      _moveCardToNewZone(card, zone, CardPosition.faceUp);
      return;
    }

    final position = await _router.showPlayCardDialog(card, newZone: zone, showActions: true);
    if (position != null) {
      _moveCardToNewZone(card, zone, position);
    }
  }

  void _onMonsterAttack(PlayCard attackingMonster, Zone targettedZone) {
    logger.verbose(_tag, '_onMonsterAttack(attackingMonster: $attackingMonster, targettedZone: $targettedZone)');

    _sendAttackCardEvent(attackingMonster, targettedZone.cards.first);

    // TODO: attack animation

    // TODO: receive attack events
  }

  void _moveCardToNewZone(PlayCard card, Zone newZone, CardPosition position) {
    logger.verbose(_tag, '_moveCardToNewZone(card: $card, newZone: $newZone, position: $position)');

    if (card.zoneType == newZone.zoneType) {
      return;
    }

    final userState = _duelState.value.userState;
    final updatedUserState = _moveCardUseCase(userState, card, position, newZone: newZone);
    if (userState == updatedUserState) {
      return;
    }

    _sendPlayCardEvent(card, newZone.zoneType, position);
    _duelState.add(_duelState.value.copyWith(userState: updatedUserState));
  }

  //endregion

  //region Deck actions

  Iterable<DeckAction> getDeckActions() {
    logger.info(_tag, 'getDeckActions()');

    return _dataManager.getDeckActions();
  }

  void onDeckPressed() {
    logger.info(_tag, 'onDeckPressed()');

    _screenEvent.add(const SpeedDuelHideOverlaysEvent());
  }

  Future<void> onDeckActionSelected(DeckAction deckAction) {
    logger.info(_tag, 'onDeckActionSelected($deckAction)');

    _screenEvent.add(const SpeedDuelHideOverlaysEvent());

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

    _sendPlayCardEvent(drawnCard, ZoneType.hand, CardPosition.faceUp);

    final updatedUserState = userState.copyWith(
      deckZone: userState.deckZone.copyWith(cards: deck),
      hand: userState.hand.copyWith(cards: [...userState.hand.cards, drawnCard]),
    );

    _duelState.add(_duelState.value.copyWith(userState: updatedUserState));
  }

  void _shuffleDeck() {
    logger.verbose(_tag, '_shuffleDeck()');

    final userState = _duelState.value.userState;
    final shuffledDeck = userState.deckZone.cards.toList()..shuffle();
    final updatedUserState = userState.copyWith(
      deckZone: userState.deckZone.copyWith(cards: shuffledDeck),
    );

    _duelState.add(_duelState.value.copyWith(userState: updatedUserState));
  }

  Future<void> _surrender() async {
    logger.verbose(_tag, '_surrender()');

    final surrender = await _router.showDialog(const DialogConfig(
      title: 'Surrender',
      description: 'Are you sure you want to surrender?',
      positiveButtonText: 'Yes',
      negativeButtonText: 'Cancel',
    ));

    if (surrender ?? false) {
      _duelOver = true;
      _sendSurrenderEvent();
    }
  }

  Future<void> _summonToken() async {
    logger.verbose(_tag, '_summonToken()');

    final userState = _duelState.value.userState;
    final tokenZone = userState.mainMonsterZones.firstWhere((zone) => zone.isEmpty, orElse: () => null);
    if (tokenZone == null) {
      _snackBarService.showSnackBar('You need an empty main monster zone to summon a token.');
      return;
    }

    final token = await _dataManager.getToken();
    final tokenCount = userState.cards.where((card) => card.yugiohCard.id == token.id).length;
    final tokenCard = _createPlayCardUseCase(token, userState.duelistId, tokenCount + 1);
    return onZoneAcceptsCard(tokenCard, tokenZone);
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

    final position = await _router.showPlayCardDialog(card, showActions: true);
    if (position == null) {
      return;
    }

    _updateCardPosition(card, position);
  }

  Future<void> _handleOpponentCardPressed(PlayCard card) async {
    logger.verbose(_tag, '_handleOpponentCardPressed(card: $card)');

    if (card.position.isFaceDown || card.zoneType == ZoneType.hand) {
      return;
    }

    await _router.showPlayCardDialog(card);
  }

  void _updateCardPosition(PlayCard card, CardPosition position) {
    logger.verbose(_tag, '_updateCardPosition(card: $card, position: $position)');

    final userState = _duelState.value.userState;
    final updatedUserState = _moveCardUseCase(userState, card, position);
    if (userState == updatedUserState) {
      return;
    }

    if (position == CardPosition.destroy) {
      _sendRemoveCardEvent(card);
    } else {
      _sendPlayCardEvent(card, card.zoneType, position);
    }

    _duelState.add(_duelState.value.copyWith(userState: updatedUserState));
  }

  void onMultiCardZonePressed(PlayerState playerState, Zone zone) {
    logger.info(_tag, 'onMultiCardZonePressed(playerState: $playerState, zone: $zone)');

    if (zone.cards.isEmpty) {
      return;
    }

    _screenEvent.add(SpeedDuelInspectCardPileEvent(playerState, zone));
  }

  //endregion

  //region Send smart duel events

  void _sendPlayCardEvent(PlayCard card, ZoneType zoneType, CardPosition newPosition) {
    logger.verbose(_tag, '_sendPlayCardEvent(card: $card, zoneType: $zoneType, newPosition: $newPosition)');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.playCard(
        CardEventData(
          duelistId: _smartDuelServer.getDuelistId(),
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
          cardPosition: _enumHelper.convertToString(newPosition),
          zoneName: _enumHelper.convertToString(zoneType),
        ),
      ),
    );
  }

  void _sendRemoveCardEvent(PlayCard card) {
    logger.verbose(_tag, '_sendRemoveCardEvent(card: $card)');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.removeCard(
        CardEventData(
          duelistId: _smartDuelServer.getDuelistId(),
          cardId: card.yugiohCard.id,
          copyNumber: card.copyNumber,
        ),
      ),
    );
  }

  void _sendAttackCardEvent(PlayCard attacker, PlayCard target) {
    logger.verbose(_tag, '_sendAttackCardEvent(attacker: $attacker, target: $target)');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.attackCard(
        CardEventData(
          duelistId: _smartDuelServer.getDuelistId(),
          cardId: attacker.yugiohCard.id,
          copyNumber: attacker.copyNumber,
          targetCardId: target.yugiohCard.id,
          targetCardCopyNumber: target.copyNumber,
        ),
      ),
    );
  }

  void _sendSurrenderEvent() {
    logger.verbose(_tag, '_sendSurrenderEvent()');

    _smartDuelServer.emitEvent(SmartDuelEvent.surrenderRoom(
      RoomEventData(roomName: _duelRoom.roomName),
    ));
  }

  //endregion

  //region Receive smart duel events

  Future<void> _onSmartDuelEventReceived(SmartDuelEvent event) async {
    logger.verbose(_tag, '_onSmartDuelEventReceived(event: $event)');

    if (event.scope == SmartDuelEventConstants.cardScope) {
      await _handleCardEvent(event);
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
      }
    }
  }

  Future<void> _handlePlayCardEvent(CardEventData data) async {
    logger.verbose(_tag, '_handlePlayCardEvent(data: $data)');

    final cardId = data.cardId;
    final copyNumber = data.copyNumber;
    final zoneType = parseZoneType(data.zoneName);
    final position = parseCardPosition(data.cardPosition);
    if (cardId == null || copyNumber == null || zoneType == null || position == null) {
      return;
    }

    final opponentState = _duelState.value.opponentState;

    PlayCard playCard = opponentState.cards
        .firstWhere((card) => card.yugiohCard.id == cardId && card.copyNumber == copyNumber, orElse: () => null);

    if (playCard == null) {
      final token = await _dataManager.getToken();
      if (cardId != token.id) {
        throw Exception('Card with ID $cardId was played, but is not in the decklist and is not a token');
      }

      final tokenCount = opponentState.cards.where((card) => card.yugiohCard.id == token.id).length;
      playCard = _createPlayCardUseCase(token, opponentState.duelistId, tokenCount + 1);
    }

    final newZone = opponentState.zones.firstWhere((zone) => zone.zoneType == zoneType);

    final updatedOpponentState = _moveCardUseCase(opponentState, playCard, position, newZone: newZone);
    if (opponentState == updatedOpponentState) {
      return;
    }

    _duelState.add(_duelState.value.copyWith(opponentState: updatedOpponentState));
  }

  Future<void> _handleRemoveCardEvent(CardEventData data) async {
    logger.verbose(_tag, '_handleRemoveCardEvent(data: $data)');

    final cardId = data.cardId;
    final copyNumber = data.copyNumber;
    if (cardId == null || copyNumber == null) {
      return;
    }

    final opponentState = _duelState.value.opponentState;

    final playCard =
        opponentState.cards.firstWhere((card) => card.yugiohCard.id == cardId && card.copyNumber == copyNumber);

    final updatedOpponentState = _moveCardUseCase(opponentState, playCard, CardPosition.destroy);
    if (opponentState == updatedOpponentState) {
      return;
    }

    _duelState.add(_duelState.value.copyWith(opponentState: updatedOpponentState));
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
  void dispose() {
    logger.info(_tag, 'dispose()');

    _cancelSpeedDuelStateSubscription();
    _cancelSmartDuelEventSubscription();

    _smartDuelServer.dispose();

    _duelState.close();
    _screenState.close();
    _screenEvent.close();

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
