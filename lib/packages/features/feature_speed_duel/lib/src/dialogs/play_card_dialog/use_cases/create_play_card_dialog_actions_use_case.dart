import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_action_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

// TODO: Don't use duplicate actions
@LazySingleton()
class CreatePlayCardDialogActionsUseCase {
  Iterable<PlayCardDialogAction> call(PlayCard playCard, Zone newZone) {
    if (playCard.zoneType.isMultiCardZone) {
      if (newZone == null) {
        return [];
      }

      if (newZone.zoneType.isMainMonsterZone) {
        return [
          PlayCardDialogAction(name: 'Summon', type: PlayCardDialogSummonAction(playCard), icon: Icons.credit_card),
          PlayCardDialogAction(
              name: 'Set', type: PlayCardDialogSetAction(playCard, newZone: newZone), icon: Icons.credit_card),
        ];
      }

      return [
        const PlayCardDialogAction(name: 'Activate', type: PlayCardDialogActivateAction(), icon: Icons.credit_card),
        PlayCardDialogAction(
            name: 'Set', type: PlayCardDialogSetAction(playCard, newZone: newZone), icon: Icons.credit_card),
      ];
    }

    if (playCard.zoneType.isMainMonsterZone) {
      if (playCard.position == CardPosition.faceUp) {
        return [
          PlayCardDialogAction(name: 'To DEF', type: PlayCardDialogToDefenseAction(playCard), icon: Icons.credit_card),
          PlayCardDialogAction(
              name: 'Set', type: PlayCardDialogSetAction(playCard, newZone: newZone), icon: Icons.credit_card),
        ];
      } else if (playCard.position == CardPosition.faceUpDefence) {
        return [
          PlayCardDialogAction(name: 'To ATK', type: PlayCardDialogToAttackAction(playCard), icon: Icons.credit_card),
          PlayCardDialogAction(
              name: 'Set', type: PlayCardDialogSetAction(playCard, newZone: newZone), icon: Icons.credit_card),
        ];
      } else if (playCard.position == CardPosition.faceDown) {
        return [
          PlayCardDialogAction(name: 'To DEF', type: PlayCardDialogToDefenseAction(playCard), icon: Icons.credit_card),
          PlayCardDialogAction(name: 'Summon', type: PlayCardDialogSummonAction(playCard), icon: Icons.credit_card),
        ];
      } else {
        return [
          PlayCardDialogAction(name: 'To ATK', type: PlayCardDialogToAttackAction(playCard), icon: Icons.credit_card),
          PlayCardDialogAction(name: 'Summon', type: PlayCardDialogSummonAction(playCard), icon: Icons.credit_card),
        ];
      }
    }

    if (playCard.zoneType.isSpellTrapCardZone) {
      if (playCard.position == CardPosition.faceUp) {
        return [
          PlayCardDialogAction(
              name: 'Set', type: PlayCardDialogSetAction(playCard, newZone: newZone), icon: Icons.credit_card),
        ];
      } else {
        return [
          const PlayCardDialogAction(name: 'Activate', type: PlayCardDialogActivateAction(), icon: Icons.credit_card),
        ];
      }
    }

    return [];
  }
}
