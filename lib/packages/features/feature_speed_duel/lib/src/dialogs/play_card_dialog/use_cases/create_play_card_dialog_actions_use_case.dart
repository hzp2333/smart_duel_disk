import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

@LazySingleton()
class CreatePlayCardDialogActionsUseCase {
  Iterable<PlayCardDialogAction> call(PlayCard playCard, Zone? newZone) {
    if (playCard.zoneType.isMultiCardZone && newZone != null) {
      return _getMultiCardZoneActions(playCard, newZone);
    }

    if (playCard.zoneType.isMainMonsterZone) {
      return (newZone?.zoneType.isSpellTrapCardZone ?? false)
          ? [
              PlayCardDialogAction.activate(),
              PlayCardDialogAction.set(),
            ]
          : _getMonsterPositionActions(playCard);
    }

    if (playCard.zoneType.isSpellTrapCardZone ||
        playCard.zoneType == ZoneType.field ||
        playCard.zoneType == ZoneType.skill) {
      return (newZone?.zoneType.isMainMonsterZone ?? false)
          ? [
              PlayCardDialogAction.normalSummon(),
              PlayCardDialogAction.set(),
              PlayCardDialogAction.specialSummonAttack(),
              PlayCardDialogAction.specialSummonDefence(),
            ]
          : _getSpellTrapSkillPositionActions(playCard);
    }

    return [];
  }

  Iterable<PlayCardDialogAction> _getMultiCardZoneActions(PlayCard playCard, Zone newZone) {
    return newZone.zoneType.isMainMonsterZone
        ? [
            if (playCard.yugiohCard.type != CardType.token) ...[
              PlayCardDialogAction.normalSummon(),
              PlayCardDialogAction.set(),
            ],
            PlayCardDialogAction.specialSummonAttack(),
            PlayCardDialogAction.specialSummonDefence(),
          ]
        : [
            PlayCardDialogAction.activate(),
            PlayCardDialogAction.set(),
          ];
  }

  Iterable<PlayCardDialogAction> _getMonsterPositionActions(PlayCard playCard) {
    final faceDownAction =
        playCard.yugiohCard.type == CardType.token ? PlayCardDialogAction.destroy() : PlayCardDialogAction.set();

    if (playCard.position == CardPosition.faceUp) {
      return [
        PlayCardDialogAction.toDefence(),
        faceDownAction,
      ];
    }

    if (playCard.position == CardPosition.faceUpDefence) {
      return [
        PlayCardDialogAction.toAttack(),
        faceDownAction,
      ];
    }

    // Face down defence
    return [
      PlayCardDialogAction.flip(),
      PlayCardDialogAction.flipSummon(),
    ];
  }

  Iterable<PlayCardDialogAction> _getSpellTrapSkillPositionActions(PlayCard playCard) {
    return playCard.position == CardPosition.faceUp ? [PlayCardDialogAction.set()] : [PlayCardDialogAction.activate()];
  }
}
