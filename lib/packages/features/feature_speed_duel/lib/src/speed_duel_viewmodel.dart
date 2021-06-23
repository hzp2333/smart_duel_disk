import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/core_messaging_interface/lib/src/snack_bar/snack_bar_service.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_event.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/usecases/move_card_use_case.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart';

import 'models/deck_action.dart';
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
  final RouterHelper _router;
  final SmartDuelServer _smartDuelServer;
  final CreatePlayerStateUseCase _createPlayerStateUseCase;
  final CreatePlayCardUseCase _createPlayCardUseCase;
  final DoesCardFitInZoneUseCase _doesCardFitInZoneUseCase;
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
  StreamSubscription<SmartDuelEvent> _cardEventSubscription;

  bool _initialized = false;
  bool _surrendered = false;

  SpeedDuelViewModel(
    Logger logger,
    @factoryParam this._duelRoom,
    this._router,
    this._smartDuelServer,
    this._createPlayerStateUseCase,
    this._createPlayCardUseCase,
    this._doesCardFitInZoneUseCase,
    this._moveCardUseCase,
    this._dataManager,
    this._enumHelper,
    this._crashlyticsProvider,
    this._snackBarService,
  ) : super(logger);

  //region Lifecycle

  bool onBackPressed() {
    logger.info(_tag, 'onBackPressed()');

    final canPop = _surrendered || _screenState.value is! SpeedDuelData;
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

    _cardEventSubscription = _smartDuelServer.cardEvents.listen(_onCardEventReceived);
  }

  //endregion

  //region Drag & drop

  bool onWillZoneAcceptCard(PlayCard card, Zone zone) {
    logger.info(_tag, 'onWillZoneAcceptCard($card, $zone)');

    _screenEvent.add(const SpeedDuelHideOverlaysEvent());

    final userState = _duelState.value.userState;

    return _doesCardFitInZoneUseCase(card, zone, userState);
  }

  Future<void> onZoneAcceptsCard(PlayCard card, Zone newZone) async {
    logger.info(_tag, 'onZoneAcceptsCard($card, $newZone)');

    if (newZone.zoneType.isMultiCardZone) {
      _moveCardToNewZone(card, newZone, CardPosition.faceUp);
      return;
    }

    final position = await _router.showPlayCardDialog(card, newZone: newZone, showActions: true);
    if (position != null) {
      _moveCardToNewZone(card, newZone, position);
    }
  }

  void _moveCardToNewZone(PlayCard card, Zone newZone, CardPosition position) {
    logger.verbose(_tag, '_moveCardToNewZone(card: $card, newZone: $newZone, position: $position)');

    _screenEvent.add(const SpeedDuelHideOverlaysEvent());

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

  Future<void> onDeckActionSelected(DeckAction deckAction) {
    logger.info(_tag, 'onDeckActionSelected($deckAction)');

    switch (deckAction) {
      case DeckAction.drawCard:
        return _showDrawCard();
      case DeckAction.showDeckList:
        return Future.sync(_showDeckList);
      case DeckAction.shuffleDeck:
        return Future.sync(_shuffleDeck);
      case DeckAction.surrender:
        return _surrender();
      case DeckAction.spawnToken:
        return _spawnToken();
      default:
        return Future.value();
    }
  }

  Future<void> _showDrawCard() {
    logger.verbose(_tag, '_showDrawCard()');

    _screenEvent.add(const SpeedDuelHideOverlaysEvent());

    return _router.showDrawCard(_drawCard);
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
      positiveButton: 'Yes',
      negativeButton: 'Cancel',
    ));

    if (surrender ?? false) {
      _surrendered = true;
      _router.closeScreen();
    }
  }

  Future<void> _spawnToken() async {
    logger.verbose(_tag, '_spawnToken()');

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
          cardId: card.yugiohCard.id.toString(),
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
          cardId: card.yugiohCard.id.toString(),
          copyNumber: card.copyNumber,
        ),
      ),
    );
  }

  //endregion

  //region Receive card events

  Future<void> _onCardEventReceived(SmartDuelEvent event) async {
    logger.verbose(_tag, '_onCardEventReceived(event: $event)');

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

    final cardId = int.tryParse(data.cardId);
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

    final cardId = int.tryParse(data.cardId);
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

    _cardEventSubscription?.cancel();
    _cardEventSubscription = null;
  }

  //endregion
}
