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
    // Move card from multi-card zone to the field.
    if (playCard.zoneType.isMultiCardZone && newZone != null) {
      return _getMultiCardZoneActions(playCard, newZone);
    }

    // Perform card action in the hand.
    if (playCard.zoneType == ZoneType.hand) {
      return _getHandActions(playCard);
    }

    if (playCard.zoneType.isMainMonsterZone) {
      if (newZone == null) {
        // Perform card action in the monster zone.
        return _getMonsterPositionActions(playCard);
      }

      // Move card from monster zone to spell/trap, field or skill zone.
      return _getMoveCardToSpellTrapSkillZoneActions(playCard);
    }

    if (playCard.zoneType.isSpellTrapCardZone ||
        playCard.zoneType == ZoneType.field ||
        playCard.zoneType == ZoneType.skill) {
      if (newZone == null) {
        // Perform card action in the spell/trap, field or skill zone.
        return _getSpellTrapSkillPositionActions(playCard);
      }

      // Move card from spell/trap, field or skill zone to monster zone.
      return _getMoveCardToMonsterZoneActions(playCard);
    }

    return [];
  }

  Iterable<PlayCardDialogAction> _getMultiCardZoneActions(PlayCard playCard, Zone newZone) {
    if (newZone.zoneType.isMainMonsterZone) {
      return _getMoveCardToMonsterZoneActions(playCard);
    }

    return _getMoveCardToSpellTrapSkillZoneActions(playCard);
  }

  Iterable<PlayCardDialogAction> _getMoveCardToMonsterZoneActions(PlayCard playCard) {
    return [
      if (playCard.yugiohCard.type != CardType.token) ...const [
        NormalSummonAction(),
        SetMonsterAction(),
      ],
      const SpecialSummonAttackAction(),
      const SpecialSummonDefenceAction(),
    ];
  }

  Iterable<PlayCardDialogAction> _getMoveCardToSpellTrapSkillZoneActions(PlayCard playCard) {
    return const [
      ActivateAction(),
      SetSpellTrapAction(),
    ];
  }

  Iterable<PlayCardDialogAction> _getHandActions(PlayCard playCard) {
    if (playCard.revealed) {
      return const [
        HideCardAction(),
        GiveToOpponentAction(),
      ];
    }

    return const [RevealCardAction()];
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

    final faceDownAction =
        playCard.yugiohCard.type == CardType.token ? const DestroyAction() : const SetSpellTrapAction();

    return [
      faceDownAction,
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
