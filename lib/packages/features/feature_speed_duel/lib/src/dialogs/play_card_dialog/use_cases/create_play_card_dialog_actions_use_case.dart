import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';

@LazySingleton()
class CreatePlayCardDialogActionsUseCase {
  static const _tag = 'CreatePlayCardDialogActionsUseCase';

  final Logger _logger;

  CreatePlayCardDialogActionsUseCase(
    this._logger,
  );

  Iterable<PlayCardDialogAction> call(PlayCard playCard, Zone newZone) {
    _logger.info(_tag, 'call(playCard: $playCard, newZone: $newZone)');

    if (playCard.zoneType.isMultiCardZone && newZone != null) {
      return _getMultiCardZoneActions(playCard, newZone);
    }

    if (playCard.zoneType.isMainMonsterZone) {
      if (newZone?.zoneType?.isSpellTrapCardZone ?? false) {
        return _getSpellTrapFieldZoneActions(playCard, newZone);
      }

      return _getMainMonsterZoneActions(playCard, newZone);
    }

    if (playCard.zoneType.isSpellTrapCardZone || playCard.zoneType == ZoneType.field) {
      if (newZone?.zoneType?.isMainMonsterZone ?? false) {
        return _getSpecialSummonActions();
      }

      return _getSpellTrapFieldZoneActions(playCard, newZone);
    }

    return [];
  }

  Iterable<PlayCardDialogAction> _getMultiCardZoneActions(PlayCard playCard, Zone newZone) {
    _logger.verbose(_tag, '_getMultiCardZoneActions(playCard: $playCard, newZone: $newZone');

    if (newZone.zoneType.isMainMonsterZone) {
      if (playCard.yugiohCard.type == CardType.token) {
        return _getSpecialSummonActions();
      }

      return _getNormalSummonActions();
    }

    return _getPlaySpellTrapActions();
  }

  Iterable<PlayCardDialogAction> _getMainMonsterZoneActions(PlayCard playCard, Zone newZone) {
    _logger.verbose(_tag, '_getMainMonsterZoneActions(playCard: $playCard, newZone: $newZone');

    if (playCard.position == CardPosition.faceUp) {
      return [
        PlayCardDialogAction.toDefence(),
        if (playCard.yugiohCard.type == CardType.token) ...{
          PlayCardDialogAction.destroy(),
        } else ...{
          PlayCardDialogAction.set(),
        },
      ];
    }

    if (playCard.position == CardPosition.faceUpDefence) {
      return [
        PlayCardDialogAction.toAttack(),
        if (playCard.yugiohCard.type == CardType.token) ...{
          PlayCardDialogAction.destroy(),
        } else ...{
          PlayCardDialogAction.set(),
        },
      ];
    }

    return [
      PlayCardDialogAction.flip(),
      PlayCardDialogAction.summon(),
    ];
  }

  Iterable<PlayCardDialogAction> _getSpellTrapFieldZoneActions(PlayCard playCard, Zone newZone) {
    _logger.verbose(_tag, '_getSpellTrapFieldZoneActions(playCard: $playCard, newZone: $newZone');

    if (playCard.zoneType.isMainMonsterZone) {
      return _getPlaySpellTrapActions();
    }

    return playCard.position == CardPosition.faceUp ? [PlayCardDialogAction.set()] : [PlayCardDialogAction.activate()];
  }

  //region Action sets

  Iterable<PlayCardDialogAction> _getNormalSummonActions() {
    _logger.verbose(_tag, '_getNormalSummonActions()');

    return [
      PlayCardDialogAction.summon(),
      PlayCardDialogAction.set(),
    ];
  }

  Iterable<PlayCardDialogAction> _getSpecialSummonActions() {
    _logger.verbose(_tag, '_getSpecialSummonActions()');

    return [
      PlayCardDialogAction.summonAttack(),
      PlayCardDialogAction.summonDefence(),
    ];
  }

  Iterable<PlayCardDialogAction> _getPlaySpellTrapActions() {
    _logger.verbose(_tag, '_getPlaySpellTrapActions()');

    return [
      PlayCardDialogAction.activate(),
      PlayCardDialogAction.set(),
    ];
  }

  //endregion
}
