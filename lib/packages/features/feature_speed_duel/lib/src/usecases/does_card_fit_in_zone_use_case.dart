import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

@LazySingleton()
class DoesCardFitInZoneUseCase {
  bool call(PlayCard playCard, Zone zone, PlayerState currentState) {
    final card = playCard.yugiohCard;

    switch (zone.zoneType) {
      case ZoneType.hand:
        return card.type != CardType.fusionMonster && card.type != CardType.token && card.type != CardType.unknown;

      case ZoneType.field:
        return card.race == CardRace.field && currentState.fieldZone.cards.isEmpty;

      case ZoneType.mainMonster1:
        return (card.type == CardType.effectMonster ||
                card.type == CardType.flipEffectMonster ||
                card.type == CardType.fusionMonster ||
                card.type == CardType.normalMonster ||
                card.type == CardType.ritualEffectMonster ||
                card.type == CardType.ritualMonster ||
                card.type == CardType.toonMonster ||
                card.type == CardType.unionEffectMonster) &&
            currentState.mainMonsterZone1.cards.isEmpty;

      case ZoneType.mainMonster2:
        return (card.type == CardType.effectMonster ||
                card.type == CardType.flipEffectMonster ||
                card.type == CardType.fusionMonster ||
                card.type == CardType.normalMonster ||
                card.type == CardType.ritualEffectMonster ||
                card.type == CardType.ritualMonster ||
                card.type == CardType.toonMonster ||
                card.type == CardType.unionEffectMonster) &&
            currentState.mainMonsterZone2.cards.isEmpty;

      case ZoneType.mainMonster3:
        return (card.type == CardType.effectMonster ||
                card.type == CardType.flipEffectMonster ||
                card.type == CardType.fusionMonster ||
                card.type == CardType.normalMonster ||
                card.type == CardType.ritualEffectMonster ||
                card.type == CardType.ritualMonster ||
                card.type == CardType.toonMonster ||
                card.type == CardType.unionEffectMonster) &&
            currentState.mainMonsterZone3.cards.isEmpty;

      case ZoneType.graveyard:
        return card.type != CardType.token && card.type != CardType.unknown;

      case ZoneType.banished:
        return card.type != CardType.token && card.type != CardType.unknown;

      case ZoneType.extraDeck:
        return card.type == CardType.fusionMonster;

      case ZoneType.spellTrap1:
        return (card.type == CardType.trapCard ||
                (card.type == CardType.spellCard && card.race != CardRace.field) ||
                card.type == CardType.unionEffectMonster) &&
            currentState.spellTrapZone1.cards.isEmpty;

      case ZoneType.spellTrap2:
        return (card.type == CardType.trapCard ||
                (card.type == CardType.spellCard && card.race != CardRace.field) ||
                card.type == CardType.unionEffectMonster) &&
            currentState.spellTrapZone2.cards.isEmpty;

      case ZoneType.spellTrap3:
        return (card.type == CardType.trapCard ||
                (card.type == CardType.spellCard && card.race != CardRace.field) ||
                card.type == CardType.unionEffectMonster) &&
            currentState.spellTrapZone3.cards.isEmpty;

      case ZoneType.deck:
        return card.type != CardType.fusionMonster && card.type != CardType.token && card.type != CardType.unknown;

      default:
        return false;
    }
  }
}
