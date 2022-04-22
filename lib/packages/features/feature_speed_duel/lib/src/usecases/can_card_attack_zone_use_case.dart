import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';

@LazySingleton()
class CanCardAttackZoneUseCase {
  bool call(PlayCard attackingCard, Zone targettedZone, String duelistId) {
    if (!attackingCard.yugiohCard.isMonster && !(attackingCard.yugiohCard.type == CardType.trapCard)) return false;
    if (!attackingCard.position.isFaceUp) return false;
    if (!attackingCard.zoneType.isMainMonsterZone) return false;
    if (targettedZone.duelistId == duelistId) return false;

    // Direct attack
    if (targettedZone.zoneType == ZoneType.hand) return true;

    // Attack a monster of the opponent
    if (targettedZone.zoneType.isMainMonsterZone && targettedZone.cards.isNotEmpty) return true;

    return false;
  }
}
