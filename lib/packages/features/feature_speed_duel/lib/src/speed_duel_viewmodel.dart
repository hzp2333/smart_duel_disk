import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart';

import 'models/zone_type.dart';
import 'usecases/get_cards_from_deck_use_case.dart';

@Injectable()
class SpeedDuelViewModel extends BaseViewModel {
  static const _tag = 'SpeedDuelViewModel';

  static const _speedDuelStartHandLength = 4;

  final PreBuiltDeck _preBuiltDeck;
  final SmartDuelServer _smartDuelServer;
  final GetCardsFromDeckUseCase _getCardsFromDeckUseCase;
  final EnumHelper _enumHelper;

  final _playerState = BehaviorSubject<PlayerState>.seeded(const PlayerState());
  Stream<PlayerState> get playerState => _playerState.stream;

  SpeedDuelViewModel(
    Logger logger,
    @factoryParam this._preBuiltDeck,
    this._smartDuelServer,
    this._getCardsFromDeckUseCase,
    this._enumHelper,
  ) : super(
          logger,
        ) {
    _init();
  }

  Future<void> _init() async {
    logger.verbose(_tag, '_init()');

    await _setDeck();
    _shuffleDeck();
    _drawStartHand();

    _smartDuelServer.connect();
  }

  Future<void> _setDeck() async {
    logger.verbose(_tag, '_setDeck()');

    final allCards = await _getCardsFromDeckUseCase(_preBuiltDeck);

    final mainDeck = allCards
        .where((card) => card.type != CardType.fusionMonster)
        .map((card) => PlayCard(yugiohCard: card, zoneType: ZoneType.deck));

    final extraDeck = allCards
        .where((card) => card.type == CardType.fusionMonster)
        .map((card) => PlayCard(yugiohCard: card, zoneType: ZoneType.extraDeck));

    final currentState = _playerState.value;
    final updatedState = currentState.copyWith(
      deckZone: currentState.deckZone.copyWith(cards: mainDeck),
      extraDeckZone: currentState.extraDeckZone.copyWith(cards: extraDeck),
    );

    _playerState.add(updatedState);
  }

  void _shuffleDeck() {
    logger.verbose(_tag, '_shuffleDeck()');

    final currentState = _playerState.value;
    final updatedState = currentState.copyWith(
      deckZone: currentState.deckZone.copyWith(cards: currentState.deckZone.cards.toList()..shuffle()),
    );

    _playerState.add(updatedState);
  }

  void _drawStartHand() {
    logger.verbose(_tag, '_drawStartHand()');

    for (var i = 0; i < _speedDuelStartHandLength; i++) {
      _drawCard(withDrawAnimation: false);
    }
  }

  void _drawCard({bool withDrawAnimation = true}) {
    logger.verbose(_tag, '_drawCard(withDrawAnimation: $withDrawAnimation)');

    final currentState = _playerState.value;
    final deck = currentState.deckZone.cards.toList();
    if (deck.isEmpty) {
      throw Exception('Deck is empty');
    }

    final drawnCard = deck.removeLast().copyWith(zoneType: ZoneType.hand);

    final updatedState = currentState.copyWith(
      deckZone: currentState.deckZone.copyWith(cards: deck),
      hand: currentState.hand.copyWith(cards: [...currentState.hand.cards, drawnCard]),
    );

    _playerState.add(updatedState);
  }

  bool onWillAccept(PlayCard card, Zone zone) {
    logger.info(_tag, 'onWillAccept($card, $zone)');

    final currentState = _playerState.value;

    switch (zone.zoneType) {
      case ZoneType.hand:
        return card.yugiohCard.type != CardType.fusionMonster;

      case ZoneType.field:
        return card.yugiohCard.race == CardRace.field && currentState.fieldZone.cards.isEmpty;

      case ZoneType.mainMonster1:
        return (card.yugiohCard.type == CardType.effectMonster ||
                card.yugiohCard.type == CardType.flipEffectMonster ||
                card.yugiohCard.type == CardType.fusionMonster ||
                card.yugiohCard.type == CardType.normalMonster ||
                card.yugiohCard.type == CardType.ritualEffectMonster ||
                card.yugiohCard.type == CardType.ritualMonster ||
                card.yugiohCard.type == CardType.toonMonster ||
                card.yugiohCard.type == CardType.unionEffectMonster) &&
            currentState.mainMonsterZone1.cards.isEmpty;

      case ZoneType.mainMonster2:
        return (card.yugiohCard.type == CardType.effectMonster ||
                card.yugiohCard.type == CardType.flipEffectMonster ||
                card.yugiohCard.type == CardType.fusionMonster ||
                card.yugiohCard.type == CardType.normalMonster ||
                card.yugiohCard.type == CardType.ritualEffectMonster ||
                card.yugiohCard.type == CardType.ritualMonster ||
                card.yugiohCard.type == CardType.toonMonster ||
                card.yugiohCard.type == CardType.unionEffectMonster) &&
            currentState.mainMonsterZone2.cards.isEmpty;

      case ZoneType.mainMonster3:
        return (card.yugiohCard.type == CardType.effectMonster ||
                card.yugiohCard.type == CardType.flipEffectMonster ||
                card.yugiohCard.type == CardType.fusionMonster ||
                card.yugiohCard.type == CardType.normalMonster ||
                card.yugiohCard.type == CardType.ritualEffectMonster ||
                card.yugiohCard.type == CardType.ritualMonster ||
                card.yugiohCard.type == CardType.toonMonster ||
                card.yugiohCard.type == CardType.unionEffectMonster) &&
            currentState.mainMonsterZone3.cards.isEmpty;

      case ZoneType.graveyard:
        return true;

      case ZoneType.extraDeck:
        return card.yugiohCard.type == CardType.fusionMonster;

      case ZoneType.spellTrap1:
        return (card.yugiohCard.type == CardType.trapCard ||
                (card.yugiohCard.type == CardType.spellCard && card.yugiohCard.race != CardRace.field)) &&
            currentState.spellTrapZone1.cards.isEmpty;

      case ZoneType.spellTrap2:
        return (card.yugiohCard.type == CardType.trapCard ||
                (card.yugiohCard.type == CardType.spellCard && card.yugiohCard.race != CardRace.field)) &&
            currentState.spellTrapZone2.cards.isEmpty;

      case ZoneType.spellTrap3:
        return (card.yugiohCard.type == CardType.trapCard ||
                (card.yugiohCard.type == CardType.spellCard && card.yugiohCard.race != CardRace.field)) &&
            currentState.spellTrapZone3.cards.isEmpty;

      case ZoneType.deck:
        return card.yugiohCard.type != CardType.fusionMonster;

      default:
        return false;
    }
  }

  void onAccept(PlayCard card, Zone newZone) {
    logger.info(_tag, 'onAccept($card, $newZone)');

    final currentState = _playerState.value;
    final currentZones = currentState.zones;

    // Remove the card from the current zone.
    final cardOldZone = currentZones.singleWhere((zone) => zone.zoneType == card.zoneType);
    if (cardOldZone.zoneType == newZone.zoneType) {
      return;
    }

    _sendSummonEvent(card.yugiohCard, newZone);
    _updatePlayerState(card, newZone, cardOldZone);
  }

  void _sendSummonEvent(YugiohCard yugiohCard, Zone newZone) {
    logger.verbose(_tag, '_sendSummonEvent($yugiohCard, $newZone)');

    _smartDuelServer.emitEvent(SummonDuelEvent(
      yugiohCardId: yugiohCard.id.toString(),
      zoneName: _enumHelper.convertToString(newZone.zoneType),
    ));
  }

  void _updatePlayerState(PlayCard card, Zone newZone, Zone oldZone) {
    logger.verbose(_tag, '_updatePlayerState($card, $newZone, $oldZone)');

    final currentState = _playerState.value;
    final currentZones = currentState.zones;

    final updatedOldZone = oldZone.copyWith(cards: [...oldZone.cards]..remove(card));

    final updatedCard = card.copyWith(zoneType: newZone.zoneType);
    final updatedNewZone = newZone.copyWith(cards: [...newZone.cards, updatedCard]);

    final updatedZones = currentZones.toList()
      ..removeWhere((zone) => zone.zoneType == updatedOldZone.zoneType)
      ..removeWhere((zone) => zone.zoneType == updatedNewZone.zoneType)
      ..add(updatedOldZone)
      ..add(updatedNewZone);

    final updatedState = currentState.copyWith(
      hand: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.hand),
      fieldZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.field),
      mainMonsterZone1: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster1),
      mainMonsterZone2: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster2),
      mainMonsterZone3: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster3),
      graveyardZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.graveyard),
      extraDeckZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.extraDeck),
      spellTrapZone1: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap1),
      spellTrapZone2: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap2),
      spellTrapZone3: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap3),
      deckZone: updatedZones.singleWhere((zone) => zone.zoneType == ZoneType.deck),
    );

    _playerState.add(updatedState);
  }

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _smartDuelServer?.dispose();
    _playerState?.close();

    super.dispose();
  }
}
