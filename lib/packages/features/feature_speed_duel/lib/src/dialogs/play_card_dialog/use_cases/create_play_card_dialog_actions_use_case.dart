import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_action_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

// TODO: Don't use duplicate actions
@LazySingleton()
class CreatePlayCardDialogActionsUseCase {
  static const _tag = 'CreatePlayCardDialogActionsUseCase';

  final Logger _logger;

  CreatePlayCardDialogActionsUseCase(
    this._logger,
  );

  Iterable<PlayCardDialogAction> call(PlayCard playCard, Zone newZone) {
    _logger.info(_tag, 'call(playCard: $playCard, newZone: $newZone)');

    if (playCard.zoneType.isMultiCardZone) {
      return _getMultiCardZoneActions(playCard, newZone);
    }

    if (playCard.zoneType.isMainMonsterZone) {
      return _getMainMonsterZoneActions(playCard, newZone);
    }

    if (playCard.zoneType.isSpellTrapCardZone || playCard.zoneType == ZoneType.field) {
      return _getSpellTrapFieldZoneActions(playCard, newZone);
    }

    return [];
  }

  Iterable<PlayCardDialogAction> _getMultiCardZoneActions(PlayCard playCard, Zone newZone) {
    _logger.verbose(_tag, '_getMultiCardZoneActions(playCard: $playCard, newZone: $newZone');

    if (newZone.zoneType.isMainMonsterZone) {
      return const [
        PlayCardDialogAction(name: 'Summon', type: PlayCardDialogSummonAction(), icon: Icons.credit_card),
        PlayCardDialogAction(name: 'Set', type: PlayCardDialogSetAction(), icon: Icons.credit_card),
      ];
    }

    return const [
      PlayCardDialogAction(name: 'Activate', type: PlayCardDialogActivateAction(), icon: Icons.credit_card),
      PlayCardDialogAction(name: 'Set', type: PlayCardDialogSetAction(), icon: Icons.credit_card),
    ];
  }

  Iterable<PlayCardDialogAction> _getMainMonsterZoneActions(PlayCard playCard, Zone newZone) {
    _logger.verbose(_tag, '_getMainMonsterZoneActions(playCard: $playCard, newZone: $newZone');

    if (playCard.position == CardPosition.faceUp) {
      return const [
        PlayCardDialogAction(name: 'To DEF', type: PlayCardDialogToDefenseAction(), icon: Icons.credit_card),
        PlayCardDialogAction(name: 'Set', type: PlayCardDialogSetAction(), icon: Icons.credit_card),
      ];
    }

    if (playCard.position == CardPosition.faceUpDefence) {
      return const [
        PlayCardDialogAction(name: 'To ATK', type: PlayCardDialogToAttackAction(), icon: Icons.credit_card),
        PlayCardDialogAction(name: 'Set', type: PlayCardDialogSetAction(), icon: Icons.credit_card),
      ];
    }

    return const [
      PlayCardDialogAction(name: 'Flip', type: PlayCardDialogFlipAction(), icon: Icons.credit_card),
      PlayCardDialogAction(name: 'Summon', type: PlayCardDialogSummonAction(), icon: Icons.credit_card),
    ];
  }

  Iterable<PlayCardDialogAction> _getSpellTrapFieldZoneActions(PlayCard playCard, Zone newZone) {
    _logger.verbose(_tag, '_getSpellTrapFieldZoneActions(playCard: $playCard, newZone: $newZone');

    if (playCard.position == CardPosition.faceUp) {
      return const [
        PlayCardDialogAction(name: 'Set', type: PlayCardDialogSetAction(), icon: Icons.credit_card),
      ];
    }

    return [
      const PlayCardDialogAction(name: 'Activate', type: PlayCardDialogActivateAction(), icon: Icons.credit_card),
    ];
  }
}
