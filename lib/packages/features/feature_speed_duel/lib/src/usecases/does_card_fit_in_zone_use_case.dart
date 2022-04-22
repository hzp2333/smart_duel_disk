import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

@LazySingleton()
class DoesCardFitInZoneUseCase {
  bool call(PlayCard playCard, Zone zone, PlayerState state) {
    final card = playCard.yugiohCard;

    switch (zone.zoneType) {
      case ZoneType.mainMonster1:
        return _fitsInMainMonsterZone(playCard) && state.mainMonsterZone1.isEmpty;

      case ZoneType.mainMonster2:
        return _fitsInMainMonsterZone(playCard) && state.mainMonsterZone2.isEmpty;

      case ZoneType.mainMonster3:
        return _fitsInMainMonsterZone(playCard) && state.mainMonsterZone3.isEmpty;

      case ZoneType.spellTrap1:
        return _fitsInSpellTrapZone(playCard) && state.spellTrapZone1.isEmpty;

      case ZoneType.spellTrap2:
        return _fitsInSpellTrapZone(playCard) && state.spellTrapZone2.isEmpty;

      case ZoneType.spellTrap3:
        return _fitsInSpellTrapZone(playCard) && state.spellTrapZone3.isEmpty;

      case ZoneType.field:
        return card.race == CardRace.field && state.fieldZone.isEmpty;

      case ZoneType.hand:
      case ZoneType.deck:
        return _fitsInDeck(playCard);

      case ZoneType.extraDeck:
        return playCard.yugiohCard.belongsInExtraDeck;

      case ZoneType.graveyard:
      case ZoneType.banished:
        return _fitsInGraveyard(card);

      case ZoneType.skill:
      default:
        return false;
    }
  }

  bool _fitsInMainMonsterZone(PlayCard playCard) {
    final card = playCard.yugiohCard;

    return !playCard.zoneType.isMainMonsterZone && (card.isMonster || playCard.yugiohCard.type == CardType.trapCard);
  }

  bool _fitsInSpellTrapZone(PlayCard playCard) {
    final card = playCard.yugiohCard;

    return !playCard.zoneType.isSpellTrapCardZone &&
        (card.type == CardType.trapCard ||
            (card.type == CardType.spellCard && card.race != CardRace.field) ||
            (card.isMonster && _fitsInGraveyard(card)));
  }

  bool _fitsInDeck(PlayCard playCard) {
    final card = playCard.yugiohCard;

    return !card.belongsInExtraDeck && _fitsInGraveyard(card);
  }

  bool _fitsInGraveyard(YugiohCard card) {
    return card.type != CardType.token && card.type != CardType.skillCard && card.type != CardType.unknown;
  }
}
