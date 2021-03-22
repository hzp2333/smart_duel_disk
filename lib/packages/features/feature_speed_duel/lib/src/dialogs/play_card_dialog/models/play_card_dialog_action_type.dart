import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

part 'play_card_dialog_action_type.freezed.dart';

@freezed
abstract class PlayCardDialogActionType with _$PlayCardDialogActionType {
  const factory PlayCardDialogActionType.summon() = PlayCardDialogSummonAction;
  const factory PlayCardDialogActionType.activate() = PlayCardDialogActivateAction;
  const factory PlayCardDialogActionType.toAttack(PlayCard playCard) = PlayCardDialogToAttackAction;
  const factory PlayCardDialogActionType.toDefense(PlayCard playCard) = PlayCardDialogToDefenseAction;
  const factory PlayCardDialogActionType.set(PlayCard playCard, {Zone newZone}) = PlayCardDialogSetAction;
}
