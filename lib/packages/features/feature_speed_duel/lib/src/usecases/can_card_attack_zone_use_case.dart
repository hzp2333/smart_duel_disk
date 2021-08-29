import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

@LazySingleton()
class CanCardAttackZoneUseCase {
  bool call(PlayCard attackingCard, Zone targettedZone, String duelistId) {
    if (!attackingCard.isMonster) return false;
    if (!attackingCard.zoneType.isMainMonsterZone) return false;
    if (targettedZone.duelistId == duelistId) return false;

    // Direct attack
    if (targettedZone.zoneType == ZoneType.hand) return true;

    // Attack a monster of the opponent
    if (targettedZone.zoneType.isMainMonsterZone && targettedZone.cards.isNotEmpty) return true;

    return false;
  }
}
