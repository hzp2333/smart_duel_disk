import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_card_dialog_action_type.freezed.dart';

@freezed
abstract class PlayCardDialogActionType with _$PlayCardDialogActionType {
  const factory PlayCardDialogActionType.summon() = PlayCardDialogSummonAction;
  const factory PlayCardDialogActionType.activate() = PlayCardDialogActivateAction;
  const factory PlayCardDialogActionType.toAttack() = PlayCardDialogToAttackAction;
  const factory PlayCardDialogActionType.toDefence() = PlayCardDialogToDefenceAction;
  const factory PlayCardDialogActionType.flip() = PlayCardDialogFlipAction;
  const factory PlayCardDialogActionType.set() = PlayCardDialogSetAction;
}
