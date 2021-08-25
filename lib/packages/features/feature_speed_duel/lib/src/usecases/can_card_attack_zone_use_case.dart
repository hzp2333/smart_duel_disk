import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

@LazySingleton()
class CanCardAttackZoneUseCase {
  bool call(PlayCard attackingCard, Zone targettedZone, String duelistId) {
    return attackingCard.isMonster &&
        attackingCard.zoneType.isMainMonsterZone &&
        targettedZone.duelistId != duelistId &&
        targettedZone.zoneType.isMainMonsterZone &&
        targettedZone.cards.isNotEmpty;
  }
}
