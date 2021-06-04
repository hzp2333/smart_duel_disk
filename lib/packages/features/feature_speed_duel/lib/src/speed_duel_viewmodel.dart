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
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_event.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart';

import 'models/deck_action.dart';
import 'models/zone_type.dart';
import 'usecases/create_play_card_use_case.dart';
import 'usecases/does_card_fit_in_zone_use_case.dart';
import 'usecases/get_cards_from_deck_use_case.dart';

@Injectable()
class SpeedDuelViewModel extends BaseViewModel {
  static const _tag = 'SpeedDuelViewModel';

  static const _speedDuelStartHandLength = 4;

  final PreBuiltDeck _preBuiltDeck;
  final RouterHelper _router;
  final SmartDuelServer _smartDuelServer;
  final GetCardsFromDeckUseCase _getCardsFromDeckUseCase;
  final CreatePlayCardUseCase _createPlayCardUseCase;
  final DoesCardFitInZoneUseCase _doesCardFitInZoneUseCase;
  final DataManager _dataManager;
  final EnumHelper _enumHelper;
  final CrashlyticsProvider _crashlyticsProvider;
  final SnackBarService _snackBarService;

  final _duelState = BehaviorSubject<SpeedDuelState>.seeded(const SpeedDuelState(
    userState: PlayerState(),
    opponentState: PlayerState(),
  ));

  final _screenState = BehaviorSubject<SpeedDuelScreenState>.seeded(const SpeedDuelLoading());
  Stream<SpeedDuelScreenState> get screenState => _screenState.stream;

  final _screenEvent = BehaviorSubject<SpeedDuelScreenEvent>();
  Stream<SpeedDuelScreenEvent> get screenEvent => _screenEvent.stream;

  StreamSubscription<SpeedDuelState> _speedDuelStateSubscription;
  StreamSubscription<SmartDuelEvent> _smartDuelEventSubscription;

  bool _initialized = false;
  bool _surrendered = false;

  SpeedDuelViewModel(
    Logger logger,
    @factoryParam this._preBuiltDeck,
    this._router,
    this._smartDuelServer,
    this._getCardsFromDeckUseCase,
    this._createPlayCardUseCase,
    this._doesCardFitInZoneUseCase,
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

    final playCards = await _getCardsFromDeckUseCase(_preBuiltDeck);

    final mainDeck = playCards.where((card) => card.yugiohCard.type != CardType.fusionMonster);
    final extraDeck = playCards
        .where((card) => card.yugiohCard.type == CardType.fusionMonster)
        .map((card) => card.copyWith(zoneType: ZoneType.extraDeck));

    final currentState = _duelState.value;
    final userState = currentState.userState;
    final updatedUserState = userState.copyWith(
      deckZone: userState.deckZone.copyWith(cards: mainDeck),
      extraDeckZone: userState.extraDeckZone.copyWith(cards: extraDeck),
    );

    _duelState.add(currentState.copyWith(userState: updatedUserState));
  }

  void _drawStartHand() {
    logger.verbose(_tag, '_drawStartHand()');

    for (var i = 0; i < _speedDuelStartHandLength; i++) {
      _drawCard();
    }
  }

  void _initSmartDuelEventSubscription() {
    logger.verbose(_tag, '_initSmartDuelEventSubscription()');

    _smartDuelEventSubscription = _smartDuelServer.smartDuelEvents.listen(_onSmartDuelEventReceived);
    _smartDuelServer.init();
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

    final position = await _router.showPlayCardDialog(card, newZone: newZone);
    if (position != null) {
      _moveCardToNewZone(card, newZone, position);
    }
  }

  void _moveCardToNewZone(PlayCard card, Zone newZone, CardPosition position) {
    logger.verbose(_tag, '_moveCardToNewZone(card: $card, newZone: $newZone, position: $position)');

    _screenEvent.add(const SpeedDuelHideOverlaysEvent());

    final userState = _duelState.value.userState;
    final userZones = userState.zones;

    final oldZone = userZones.singleWhere((zone) => zone.zoneType == card.zoneType);
    if (oldZone.zoneType == newZone.zoneType) {
      return;
    }

    _updateCardZoneAndPosition(card, newZone, oldZone, position);
  }

  void _updateCardZoneAndPosition(PlayCard card, Zone newZone, Zone oldZone, CardPosition position) {
    logger.verbose(_tag, '_updateCardZoneAndPosition($card, $newZone, $oldZone, $position)');

    final userState = _duelState.value.userState;
    final userZones = userState.zones;

    final updatedOldZone = oldZone.copyWith(cards: [...oldZone.cards]..remove(card));

    final updatedCard = card.copyWith(zoneType: newZone.zoneType, position: position);
    final updatedNewZone = newZone.copyWith(cards: [...newZone.cards, updatedCard]);

    _sendPlayCardEvent(updatedCard, newZone);
    _sendRemoveCardEvent(updatedCard, oldZone);

    final updatedZones = userZones.toList()
      ..removeWhere((zone) => zone.zoneType == updatedOldZone.zoneType)
      ..removeWhere((zone) => zone.zoneType == updatedNewZone.zoneType)
      ..add(updatedOldZone)
      ..add(updatedNewZone);

    _updatePlayerState(updatedZones);
  }

  void _updatePlayerState(List<Zone> updatedZones) {
    logger.verbose(_tag, '_updatePlayerState(updatedZones: $updatedZones)');

    final currentState = _duelState.value;
    final userState = currentState.userState;

    final updatedUserState = userState.copyWith(
      hand: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.hand),
      fieldZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.field),
      mainMonsterZone1: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster1),
      mainMonsterZone2: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster2),
      mainMonsterZone3: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster3),
      graveyardZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.graveyard),
      banishedZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.banished),
      extraDeckZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.extraDeck),
      spellTrapZone1: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap1),
      spellTrapZone2: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap2),
      spellTrapZone3: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap3),
      deckZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.deck),
    );

    _duelState.add(currentState.copyWith(userState: updatedUserState));
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
    onMultiCardZonePressed(userState.deckZone);
  }

  void _drawCard() {
    logger.verbose(_tag, '_drawCard()');

    final currentState = _duelState.value;
    final userState = currentState.userState;
    final deck = userState.deckZone.cards.toList();
    if (deck.isEmpty) {
      _snackBarService.showSnackBar('Deck is empty');
      return;
    }

    final drawnCard = deck.removeLast().copyWith(zoneType: ZoneType.hand);

    final updatedUserState = userState.copyWith(
      deckZone: userState.deckZone.copyWith(cards: deck),
      hand: userState.hand.copyWith(cards: [...userState.hand.cards, drawnCard]),
    );

    _duelState.add(currentState.copyWith(userState: updatedUserState));
  }

  void _shuffleDeck() {
    logger.verbose(_tag, '_shuffleDeck()');

    final currentState = _duelState.value;
    final userState = currentState.userState;
    final shuffledDeck = userState.deckZone.cards.toList()..shuffle();
    final updatedUserState = userState.copyWith(
      deckZone: userState.deckZone.copyWith(cards: shuffledDeck),
    );

    _duelState.add(currentState.copyWith(userState: updatedUserState));
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
    final tokenCard = _createPlayCardUseCase(token, 1);
    return onZoneAcceptsCard(tokenCard, tokenZone);
  }

  //endregion

  //region Card pressed events

  Future<void> onCardPressed(PlayCard card) async {
    final position = await _router.showPlayCardDialog(card);
    if (position == null) {
      return;
    }

    if (position == CardPosition.destroy) {
      // TODO: this is used to destroy tokens, but it isn't really a card position
      _destroyCard(card);
    } else {
      _updateCardPosition(card, position);
    }
  }

  void _updateCardPosition(PlayCard card, CardPosition position) {
    logger.verbose(_tag, '_updateCardPosition(card: $card, position: $position)');

    final currentState = _duelState.value;
    final userState = currentState.userState;
    final userZones = userState.zones;

    final cardZone = userZones.firstWhere((zone) => zone.zoneType == card.zoneType);

    final updatedCard = card.copyWith(position: position);
    final updatedCardZone = cardZone.copyWith(cards: [...cardZone.cards, updatedCard]..remove(card));

    _sendPlayCardEvent(updatedCard, cardZone);

    final updatedZones = userZones.toList()
      ..remove(cardZone)
      ..add(updatedCardZone);

    _updatePlayerState(updatedZones);
  }

  void _destroyCard(PlayCard card) {
    logger.verbose(_tag, '_destroyCard(card: $card)');

    final currentState = _duelState.value;
    final userState = currentState.userState;
    final userZones = userState.zones;
    final cardZone = userZones.firstWhere((zone) => zone.zoneType == card.zoneType);

    _sendRemoveCardEvent(card, cardZone);

    final updatedCardZone = cardZone.copyWith(cards: [...cardZone.cards]..remove(card));
    final updatedZones = userZones.toList()
      ..removeWhere((zone) => zone.zoneType == updatedCardZone.zoneType)
      ..add(updatedCardZone);

    _updatePlayerState(updatedZones);
  }

  void onMultiCardZonePressed(Zone zone) {
    logger.info(_tag, 'onMultiCardZonePressed()');

    if (zone.cards.isEmpty) {
      return;
    }

    _screenEvent.add(SpeedDuelInspectCardPileEvent(zone));
  }

  //endregion

  //region Send smart duel events

  void _sendPlayCardEvent(PlayCard card, Zone zone) {
    logger.verbose(_tag, '_sendPlayCardEvent(card: $card, zone: $zone)');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.playCard(
        CardEventData(
          cardId: card.yugiohCard.id.toString(),
          cardPosition: _enumHelper.convertToString(card.position),
          zoneName: _enumHelper.convertToString(zone.zoneType),
        ),
      ),
    );
  }

  void _sendRemoveCardEvent(PlayCard card, Zone zone) {
    logger.verbose(_tag, '_sendRemoveCardEvent(card: $card, zone: $zone)');

    _smartDuelServer.emitEvent(
      SmartDuelEvent.removeCard(
        CardEventData(
          cardId: card.yugiohCard.id.toString(),
          zoneName: _enumHelper.convertToString(zone.zoneType),
        ),
      ),
    );
  }

  //endregion

  //region Receive smart duel events

  Future<void> _onSmartDuelEventReceived(SmartDuelEvent event) async {
    logger.verbose(_tag, '_onSmartDuelEventReceived(event: $event)');

    if (event.scope == SmartDuelEventConstants.globalScope) {
      // TODO: handle errors
      return;
    }

    if (event.scope == SmartDuelEventConstants.cardScope) {
      _handleCardEvent(event);
      return;
    }
  }

  void _handleCardEvent(SmartDuelEvent event) {
    logger.verbose(_tag, '_handleCardEvent(event: $event)');

    final eventData = event.data;
    if (eventData is CardEventData) {
      switch (event.action) {
        case SmartDuelEventConstants.cardPlayAction:
          _handlePlayCardEvent(eventData);
          break;
        case SmartDuelEventConstants.cardRemoveAction:
          _handleRemoveCardEvent(eventData);
          break;
      }
    }
  }

  void _handlePlayCardEvent(CardEventData data) {
    logger.verbose(_tag, '_handlePlayCardEvent(data: $data)');
  }

  void _handleRemoveCardEvent(CardEventData data) {
    logger.verbose(_tag, '_handleRemoveCardEvent(data: $data)');
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

    _smartDuelEventSubscription?.cancel();
    _smartDuelEventSubscription = null;
  }

  //endregion
}
