import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

import 'play_card_dialog_action_type.dart';

@immutable
class PlayCardDialogAction extends Equatable {
  final String name;
  final IconData icon;
  final PlayCardDialogActionType type;

  const PlayCardDialogAction._({
    @required this.name,
    @required this.icon,
    @required this.type,
  });

  @override
  List<Object> get props => [
        name,
        icon,
        type,
      ];

  @override
  bool get stringify => true;

  static final summon = PlayCardDialogAction._(
    name: Strings.speedDuelCardActionSummon.get(),
    type: const PlayCardDialogSummonAction(),
    icon: Icons.credit_card,
  );

  static final activate = PlayCardDialogAction._(
    name: Strings.speedDuelCardActionActivate.get(),
    type: const PlayCardDialogActivateAction(),
    icon: Icons.credit_card,
  );

  static final toAttack = PlayCardDialogAction._(
    name: Strings.speedDuelCardActionToAttack.get(),
    type: const PlayCardDialogToAttackAction(),
    icon: Icons.credit_card,
  );

  static final toDefence = PlayCardDialogAction._(
    name: Strings.speedDuelCardActionToDefence.get(),
    type: const PlayCardDialogToDefenceAction(),
    icon: Icons.credit_card,
  );

  static final flip = PlayCardDialogAction._(
    name: Strings.speedDuelCardActionFlip.get(),
    type: const PlayCardDialogFlipAction(),
    icon: Icons.credit_card,
  );

  static final set = PlayCardDialogAction._(
    name: Strings.speedDuelCardActionSet.get(),
    type: const PlayCardDialogSetAction(),
    icon: Icons.credit_card,
  );
}
