import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

import 'models/zone_type.dart';

@Injectable()
class SpeedDuelViewModel {
  final _playerState = BehaviorSubject<PlayerState>.seeded(const PlayerState());
  Stream<PlayerState> get playerState => _playerState.stream;

  SpeedDuelViewModel() {
    _init();
  }

  void _init() {
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
    ];

    final currentState = _playerState.value;
    final updatedState = currentState.copyWith(hand: currentState.hand.copyWith(cards: hand));
    _playerState.add(updatedState);
  }

  bool onWillAccept(YugiohCard yugiohCard, Zone zone) {
    switch (zone.zoneType) {
      case ZoneType.hand:
        return yugiohCard.type != CardType.fusionMonster;
      case ZoneType.field:
        return yugiohCard.race == CardRace.field;
      case ZoneType.mainMonster1:
      case ZoneType.mainMonster2:
      case ZoneType.mainMonster3:
        return yugiohCard.type == CardType.effectMonster ||
            yugiohCard.type == CardType.flipEffectMonster ||
            yugiohCard.type == CardType.fusionMonster ||
            yugiohCard.type == CardType.normalMonster ||
            yugiohCard.type == CardType.ritualEffectMonster ||
            yugiohCard.type == CardType.ritualMonster ||
            yugiohCard.type == CardType.toonMonster ||
            yugiohCard.type == CardType.unionEffectMonster;
      case ZoneType.graveyard:
        return true;
      case ZoneType.extraDeck:
        return yugiohCard.type == CardType.fusionMonster;
      case ZoneType.spellTrap1:
      case ZoneType.spellTrap2:
      case ZoneType.spellTrap3:
        return yugiohCard.type == CardType.trapCard ||
            (yugiohCard.type == CardType.spellCard && yugiohCard.race != CardRace.field);
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

    final updatedOldZone = cardOldZone.copyWith(cards: [...cardOldZone.cards]..remove(yugiohCard));

    // Move the card to the new zone.
    final updatedNewZone = newZone.copyWith(cards: [yugiohCard]);

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

  void dispose() {
    _playerState?.close();
  }
}
