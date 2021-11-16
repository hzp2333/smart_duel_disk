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

    if (playCard.zoneType == ZoneType.hand) {
      return playCard.revealed ? const [HideCardAction()] : const [RevealCardAction()];
    }

    if (playCard.zoneType.isMainMonsterZone) {
      return (newZone?.zoneType.isSpellTrapCardZone ?? false)
          ? const [
              ActivateAction(),
              SetSpellTrapAction(),
            ]
          : _getMonsterPositionActions(playCard);
    }

    if (playCard.zoneType.isSpellTrapCardZone ||
        playCard.zoneType == ZoneType.field ||
        playCard.zoneType == ZoneType.skill) {
      return (newZone?.zoneType.isMainMonsterZone ?? false)
          ? const [
              NormalSummonAction(),
              SetMonsterAction(),
              SpecialSummonAttackAction(),
              SpecialSummonDefenceAction(),
            ]
          : _getSpellTrapSkillPositionActions(playCard);
    }

    return [];
  }

  Iterable<PlayCardDialogAction> _getMultiCardZoneActions(PlayCard playCard, Zone newZone) {
    return newZone.zoneType.isMainMonsterZone
        ? [
            if (playCard.yugiohCard.type != CardType.token) ...const [
              NormalSummonAction(),
              SetMonsterAction(),
            ],
            const SpecialSummonAttackAction(),
            const SpecialSummonDefenceAction(),
          ]
        : const [
            ActivateAction(),
            SetSpellTrapAction(),
          ];
  }

  Iterable<PlayCardDialogAction> _getMonsterPositionActions(PlayCard playCard) {
    if (playCard.position == CardPosition.faceDownDefence) {
      return const [
        FlipAction(),
        FlipSummonAction(),
      ];
    }

    final toAtkOrDefAction =
        playCard.position == CardPosition.faceUp ? const ToDefenceAction() : const ToAttackAction();

    final faceDownAction =
        playCard.yugiohCard.type == CardType.token ? const DestroyAction() : const SetMonsterAction();

    return [
      toAtkOrDefAction,
      faceDownAction,
      ..._getGeneralPositionActions(playCard),
    ];
  }

  Iterable<PlayCardDialogAction> _getSpellTrapSkillPositionActions(PlayCard playCard) {
    if (playCard.position == CardPosition.faceDown) {
      return const [
        ActivateAction(),
      ];
    }

    return [
      const SetSpellTrapAction(),
      ..._getGeneralPositionActions(playCard),
    ];
  }

  Iterable<PlayCardDialogAction> _getGeneralPositionActions(PlayCard playCard) {
    return [
      const DeclareAction(),
      const AddCounterAction(),
      if (playCard.counters > 0) ...[
        const RemoveCounterAction(),
      ],
    ];
  }
}
