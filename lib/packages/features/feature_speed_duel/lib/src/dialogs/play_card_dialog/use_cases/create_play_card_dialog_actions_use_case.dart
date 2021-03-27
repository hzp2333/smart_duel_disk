import 'package:injectable/injectable.dart';
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
      return [
        PlayCardDialogAction.summon(),
        PlayCardDialogAction.set(),
      ];
    }

    return [
      PlayCardDialogAction.activate(),
      PlayCardDialogAction.set(),
    ];
  }

  Iterable<PlayCardDialogAction> _getMainMonsterZoneActions(PlayCard playCard, Zone newZone) {
    _logger.verbose(_tag, '_getMainMonsterZoneActions(playCard: $playCard, newZone: $newZone');

    if (playCard.position == CardPosition.faceUp) {
      return [
        PlayCardDialogAction.toDefence(),
        PlayCardDialogAction.set(),
      ];
    }

    if (playCard.position == CardPosition.faceUpDefence) {
      return [
        PlayCardDialogAction.toAttack(),
        PlayCardDialogAction.set(),
      ];
    }

    return [
      PlayCardDialogAction.flip(),
      PlayCardDialogAction.summon(),
    ];
  }

  Iterable<PlayCardDialogAction> _getSpellTrapFieldZoneActions(PlayCard playCard, Zone newZone) {
    _logger.verbose(_tag, '_getSpellTrapFieldZoneActions(playCard: $playCard, newZone: $newZone');

    return playCard.position == CardPosition.faceUp ? [PlayCardDialogAction.set()] : [PlayCardDialogAction.activate()];
  }
}
