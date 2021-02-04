import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart';

import 'models/zone_type.dart';

@Injectable()
class SpeedDuelViewModel extends BaseViewModel {
  final SmartDuelServer _smartDuelServer;
  final EnumHelper _enumHelper;

  final _playerState = BehaviorSubject<PlayerState>.seeded(const PlayerState());
  Stream<PlayerState> get playerState => _playerState.stream;

  SpeedDuelViewModel(
    Logger logger,
    this._smartDuelServer,
    this._enumHelper,
  ) : super(
          logger,
        ) {
    _init();
  }

  void _init() {
    _initDemoCards();

    _smartDuelServer.connect();
  }

  void _initDemoCards() {
    final hand = [
      const YugiohCard(
        id: 89631139,
        name: 'Blue-Eyes White Dragon',
        type: CardType.normalMonster,
        description: 'This legendary dragon is a powerful engine of destruction',
        race: CardRace.dragon,
        imageSmallUrl: 'https://storage.googleapis.com/ygoprodeck.com/pics_small/89631139.jpg',
        imageLargeUrl: 'https://storage.googleapis.com/ygoprodeck.com/pics/89631139.jpg',
        atk: 3000,
        def: 2500,
        level: 8,
        attribute: CardAttribute.light,
        archetype: 'Blue-Eyes',
      ),
      const YugiohCard(
        id: 46986414,
        name: 'Dark Magician',
        type: CardType.normalMonster,
        description: 'The ultimate wizard in terms of attack and defense.',
        race: CardRace.spellcaster,
        imageSmallUrl: 'https://storage.googleapis.com/ygoprodeck.com/pics_small/46986414.jpg',
        imageLargeUrl: 'https://storage.googleapis.com/ygoprodeck.com/pics/46986414.jpg',
        atk: 2500,
        def: 2100,
        level: 7,
        attribute: CardAttribute.dark,
        archetype: 'Dark Magician',
      ),
      const YugiohCard(
        id: 38033121,
        name: 'Dark Magician Girl',
        type: CardType.effectMonster,
        description: 'Gains 300 ATK for every Dark Magician or Magician of Black Chaos in the GY.',
        race: CardRace.spellcaster,
        imageSmallUrl: 'https://storage.googleapis.com/ygoprodeck.com/pics_small/38033121.jpg',
        imageLargeUrl: 'https://storage.googleapis.com/ygoprodeck.com/pics/38033121.jpg',
        atk: 2000,
        def: 1700,
        level: 6,
        attribute: CardAttribute.dark,
        archetype: 'Dark Magician',
      ),
    ];

    final currentState = _playerState.value;
    final updatedState = currentState.copyWith(hand: currentState.hand.copyWith(cards: hand));
    _playerState.add(updatedState);
  }

  bool onWillAccept(YugiohCard yugiohCard, Zone zone) {
    final currentState = _playerState.value;
    final currentZones = currentState.zones;

    switch (zone.zoneType) {
      case ZoneType.hand:
        return yugiohCard.type != CardType.fusionMonster;

      case ZoneType.field:
        return yugiohCard.race == CardRace.field &&
            currentZones.singleWhere((zone) => zone.zoneType == ZoneType.field).cards.isEmpty;

      case ZoneType.mainMonster1:
        return (yugiohCard.type == CardType.effectMonster ||
                yugiohCard.type == CardType.flipEffectMonster ||
                yugiohCard.type == CardType.fusionMonster ||
                yugiohCard.type == CardType.normalMonster ||
                yugiohCard.type == CardType.ritualEffectMonster ||
                yugiohCard.type == CardType.ritualMonster ||
                yugiohCard.type == CardType.toonMonster ||
                yugiohCard.type == CardType.unionEffectMonster) &&
            currentZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster1).cards.isEmpty;

      case ZoneType.mainMonster2:
        return (yugiohCard.type == CardType.effectMonster ||
                yugiohCard.type == CardType.flipEffectMonster ||
                yugiohCard.type == CardType.fusionMonster ||
                yugiohCard.type == CardType.normalMonster ||
                yugiohCard.type == CardType.ritualEffectMonster ||
                yugiohCard.type == CardType.ritualMonster ||
                yugiohCard.type == CardType.toonMonster ||
                yugiohCard.type == CardType.unionEffectMonster) &&
            currentZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster2).cards.isEmpty;

      case ZoneType.mainMonster3:
        return (yugiohCard.type == CardType.effectMonster ||
                yugiohCard.type == CardType.flipEffectMonster ||
                yugiohCard.type == CardType.fusionMonster ||
                yugiohCard.type == CardType.normalMonster ||
                yugiohCard.type == CardType.ritualEffectMonster ||
                yugiohCard.type == CardType.ritualMonster ||
                yugiohCard.type == CardType.toonMonster ||
                yugiohCard.type == CardType.unionEffectMonster) &&
            currentZones.singleWhere((zone) => zone.zoneType == ZoneType.mainMonster3).cards.isEmpty;

      case ZoneType.graveyard:
        return true;

      case ZoneType.extraDeck:
        return yugiohCard.type == CardType.fusionMonster;

      case ZoneType.spellTrap1:
        return (yugiohCard.type == CardType.trapCard ||
                (yugiohCard.type == CardType.spellCard && yugiohCard.race != CardRace.field)) &&
            currentZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap1).cards.isEmpty;

      case ZoneType.spellTrap2:
        return (yugiohCard.type == CardType.trapCard ||
                (yugiohCard.type == CardType.spellCard && yugiohCard.race != CardRace.field)) &&
            currentZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap2).cards.isEmpty;

      case ZoneType.spellTrap3:
        return (yugiohCard.type == CardType.trapCard ||
                (yugiohCard.type == CardType.spellCard && yugiohCard.race != CardRace.field)) &&
            currentZones.singleWhere((zone) => zone.zoneType == ZoneType.spellTrap3).cards.isEmpty;

      case ZoneType.deck:
        return true;

      default:
        return false;
    }
  }

  void onAccept(YugiohCard yugiohCard, Zone newZone) {
    final currentState = _playerState.value;
    final currentZones = currentState.zones;

    // Remove the card from the current zone.
    final cardOldZone = currentZones.firstWhere((zone) => zone.cards.contains(yugiohCard));
    if (cardOldZone.zoneType == newZone.zoneType) {
      return;
    }

    _sendSummonEvent(yugiohCard, newZone);
    _updatePlayerState(currentState, currentZones, yugiohCard, newZone, cardOldZone);
  }

  void _sendSummonEvent(YugiohCard yugiohCard, Zone newZone) {
    _smartDuelServer.emitEvent(SummonDuelEvent(
      yugiohCardId: yugiohCard.id.toString(),
      zoneName: _enumHelper.convertToString(newZone.zoneType),
    ));
  }

  void _updatePlayerState(
    PlayerState currentState,
    Iterable<Zone> currentZones,
    YugiohCard yugiohCard,
    Zone newZone,
    Zone oldZone,
  ) {
    final updatedOldZone = oldZone.copyWith(cards: [...oldZone.cards]..remove(yugiohCard));

    // Move the card to the new zone.
    final updatedNewZone = newZone.copyWith(cards: [...newZone.cards, yugiohCard]);

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
    _smartDuelServer?.dispose();
    _playerState?.close();

    super.dispose();
  }
}
