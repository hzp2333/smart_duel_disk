import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

@LazySingleton()
class MoveCardUseCase {
  PlayerState call(
    PlayerState playerState,
    PlayCard card,
    CardPosition position, {
    Zone newZone,
  }) {
    final playerZones = playerState.zones.toList();

    // TODO: this is used to destroy tokens, but it isn't really a card position
    if (position == CardPosition.destroy) {
      return _removeCard(playerState, card, playerZones);
    }

    final oldZone = playerZones.firstWhere((zone) => zone.zoneType == card.zoneType);

    if (newZone == null || newZone.zoneType == card.zoneType) {
      return _updateCardPosition(playerState, card, position, playerZones, oldZone);
    }

    return _updateCardZone(playerState, card, position, playerZones, oldZone, newZone);
  }

  PlayerState _removeCard(PlayerState playerState, PlayCard card, List<Zone> playerZones) {
    final oldZone = playerZones.firstWhere((zone) => zone.zoneType == card.zoneType);
    final updatedOldZone = oldZone.copyWith(cards: [...oldZone.cards]..remove(card));

    final updatedZones = playerZones.toList()
      ..remove(oldZone)
      ..add(updatedOldZone);

    return _updatePlayerState(playerState, updatedZones);
  }

  PlayerState _updateCardPosition(
    PlayerState playerState,
    PlayCard card,
    CardPosition position,
    List<Zone> playerZones,
    Zone oldZone,
  ) {
    final updatedCard = card.copyWith(position: position);
    final updatedOldZone = oldZone.copyWith(cards: [...oldZone.cards, updatedCard]..remove(card));

    final updatedZones = playerZones.toList()
      ..remove(oldZone)
      ..add(updatedOldZone);

    return _updatePlayerState(playerState, updatedZones);
  }

  PlayerState _updateCardZone(
    PlayerState playerState,
    PlayCard card,
    CardPosition position,
    List<Zone> playerZones,
    Zone oldZone,
    Zone newZone,
  ) {
    final updatedOldZone = oldZone.copyWith(cards: [...oldZone.cards]..remove(card));

    final updatedCard = card.copyWith(zoneType: newZone.zoneType, position: position);
    final updatedNewZone = newZone.copyWith(cards: [...newZone.cards, updatedCard]);

    final updatedZones = playerZones.toList()
      ..removeWhere((zone) => zone.zoneType == updatedOldZone.zoneType)
      ..removeWhere((zone) => zone.zoneType == updatedNewZone.zoneType)
      ..add(updatedOldZone)
      ..add(updatedNewZone);

    return _updatePlayerState(playerState, updatedZones);
  }

  PlayerState _updatePlayerState(PlayerState playerState, List<Zone> updatedZones) {
    return playerState.copyWith(
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
  }
}
