import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

@LazySingleton()
class DoesCardFitInZoneUseCase {
  bool call(PlayCard playCard, Zone zone, PlayerState state) {
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
        return _fitsInFieldZone(playCard) && state.fieldZone.isEmpty;

      case ZoneType.skill:
        return _fitsInSkillZone(playCard) && state.skillZone.isEmpty;

      case ZoneType.hand:
        return _fitsInHand(playCard);

      case ZoneType.deck:
        return _fitsInDeck(playCard);

      case ZoneType.extraDeck:
        return _fitsInExtraDeck(playCard);

      case ZoneType.graveyard:
        return _fitsInGraveyard(playCard);

      case ZoneType.banished:
        return _fitsInBanished(playCard);

      default:
        return false;
    }
  }

  /*
   * Monsters fit, obviously.
   * Some trap cards can be monsters.
   * Thanks to cards like "Magical Hats", spells and other types of traps can be treated as monsters.
   */
  bool _fitsInMainMonsterZone(PlayCard playCard) {
    return !playCard.zoneType.isMainMonsterZone;
  }

  /*
   * Spells and traps fit, obviously.
   * Monsters can be equipped, this includes tokens.
   * Skill cards can be treated as spells/traps.
   * Only field spells don't fit in a spell/trap zone.
   */
  bool _fitsInSpellTrapZone(PlayCard playCard) {
    final card = playCard.yugiohCard;
    return !playCard.zoneType.isSpellTrapCardZone && card.race != CardRace.field;
  }

  /*
   * Only field spells and skill cards fit in the field zone.
   */
  bool _fitsInFieldZone(PlayCard playCard) {
    final card = playCard.yugiohCard;
    return playCard.zoneType != ZoneType.field && (card.race == CardRace.field || card.type == CardType.skillCard);
  }

  /*
   * Only skill cards fit in the skill zone.
   */
  bool _fitsInSkillZone(PlayCard playCard) {
    final card = playCard.yugiohCard;
    return playCard.zoneType != ZoneType.skill && card.type == CardType.skillCard;
  }

  /*
   * Tokens can only exist on the field.
   * Extra deck monsters normally can't be in the hand, but we make an exception
   * because a user needs to be able to give an extra deck monster to their opponent.
   */
  bool _fitsInHand(PlayCard playCard) {
    final card = playCard.yugiohCard;
    return playCard.zoneType != ZoneType.hand && card.type != CardType.token;
  }

  /*
   * Extra deck monsters can't be in the deck.
   * Tokens can only exist on the field.
   * Skill cards cannot go to the deck.
   */
  bool _fitsInDeck(PlayCard playCard) {
    final card = playCard.yugiohCard;
    return playCard.zoneType != ZoneType.deck &&
        !card.belongsInExtraDeck &&
        card.type != CardType.token &&
        card.type != CardType.skillCard;
  }

  /*
   * Only extra deck cards can be in the extra deck.
   */
  bool _fitsInExtraDeck(PlayCard playCard) {
    final card = playCard.yugiohCard;
    return playCard.zoneType != ZoneType.extraDeck && card.belongsInExtraDeck;
  }

  /*
   * Tokens cannot leave the field.
   */
  bool _fitsInGraveyard(PlayCard playCard) {
    final card = playCard.yugiohCard;
    return playCard.zoneType != ZoneType.graveyard && card.type != CardType.token;
  }

  /*
   * Tokens cannot leave the field.
   */
  bool _fitsInBanished(PlayCard playCard) {
    final card = playCard.yugiohCard;
    return playCard.zoneType != ZoneType.banished && card.type != CardType.token;
  }
}
