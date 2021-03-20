import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

@LazySingleton()
class DoesCardFitInZoneUseCase {
  bool call(PlayCard card, Zone zone, PlayerState currentState) {
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

      case ZoneType.banished:
        return true;

      case ZoneType.extraDeck:
        return card.yugiohCard.type == CardType.fusionMonster;

      case ZoneType.spellTrap1:
        return (card.yugiohCard.type == CardType.trapCard ||
                (card.yugiohCard.type == CardType.spellCard && card.yugiohCard.race != CardRace.field) ||
                card.yugiohCard.type == CardType.unionEffectMonster) &&
            currentState.spellTrapZone1.cards.isEmpty;

      case ZoneType.spellTrap2:
        return (card.yugiohCard.type == CardType.trapCard ||
                (card.yugiohCard.type == CardType.spellCard && card.yugiohCard.race != CardRace.field) ||
                card.yugiohCard.type == CardType.unionEffectMonster) &&
            currentState.spellTrapZone2.cards.isEmpty;

      case ZoneType.spellTrap3:
        return (card.yugiohCard.type == CardType.trapCard ||
                (card.yugiohCard.type == CardType.spellCard && card.yugiohCard.race != CardRace.field) ||
                card.yugiohCard.type == CardType.unionEffectMonster) &&
            currentState.spellTrapZone3.cards.isEmpty;

      case ZoneType.deck:
        return card.yugiohCard.type != CardType.fusionMonster;

      default:
        return false;
    }
  }
}
