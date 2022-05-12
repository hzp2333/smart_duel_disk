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
    Zone? newZone,
    bool moveToTop = true,
  }) {
    final playerZones = playerState.zones.toList();
    final oldZone = playerZones.firstWhere((zone) => zone.zoneType == card.zoneType);

    // TODO: this is used to destroy tokens, but it isn't really a card position
    if (position == CardPosition.destroy) {
      return _removeCard(playerState, card, playerZones, oldZone);
    }

    if (newZone == null || newZone.zoneType == card.zoneType) {
      return _updateCardPosition(playerState, card, position, playerZones, oldZone);
    }

    return _updateCardZone(playerState, card, position, playerZones, oldZone, newZone, moveToTop: moveToTop);
  }

  PlayerState _removeCard(PlayerState playerState, PlayCard card, List<Zone> playerZones, Zone oldZone) {
    final updatedOldZone = oldZone.copyWith(cards: [...oldZone.cards]..remove(card));

    final updatedZones = playerZones.toList()
      ..remove(oldZone)
      ..add(updatedOldZone);

    return playerState.copyWithAllZones(updatedZones);
  }

  PlayerState _updateCardPosition(
    PlayerState playerState,
    PlayCard card,
    CardPosition position,
    List<Zone> playerZones,
    Zone oldZone,
  ) {
    final counters = position.isFaceUp ? card.counters : 0;
    final updatedCard = card.copyWith(position: position, counters: counters);
    final updatedOldZone = oldZone.copyWith(cards: [...oldZone.cards, updatedCard]..remove(card));

    final updatedZones = playerZones.toList()
      ..remove(oldZone)
      ..add(updatedOldZone);

    return playerState.copyWithAllZones(updatedZones);
  }

  PlayerState _updateCardZone(
    PlayerState playerState,
    PlayCard card,
    CardPosition position,
    List<Zone> playerZones,
    Zone oldZone,
    Zone newZone, {
    required bool moveToTop,
  }) {
    final updatedOldZone = oldZone.copyWith(cards: [...oldZone.cards]..remove(card));

    final updatedCard = card.copyWith(
      zoneType: newZone.zoneType,
      position: position,
      counters: 0,
      revealed: false,
    );
    final updatedNewZone = newZone.copyWith(
      cards: moveToTop ? [...newZone.cards, updatedCard] : [updatedCard, ...newZone.cards],
    );

    final updatedZones = playerZones.toList()
      ..removeWhere((zone) => zone.zoneType == updatedOldZone.zoneType)
      ..removeWhere((zone) => zone.zoneType == updatedNewZone.zoneType)
      ..add(updatedOldZone)
      ..add(updatedNewZone);

    return playerState.copyWithAllZones(updatedZones);
  }
}
