import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  factory PlayCardDialogAction.summon() {
    return PlayCardDialogAction._(
      name: Strings.speedDuelCardActionSummon.get(),
      type: const PlayCardDialogSummonAction(),
      icon: FontAwesomeIcons.caretSquareUp,
    );
  }

  factory PlayCardDialogAction.activate() {
    return PlayCardDialogAction._(
      name: Strings.speedDuelCardActionActivate.get(),
      type: const PlayCardDialogActivateAction(),
      icon: FontAwesomeIcons.fireAlt,
    );
  }

  factory PlayCardDialogAction.toAttack() {
    return PlayCardDialogAction._(
      name: Strings.speedDuelCardActionToAttack.get(),
      type: const PlayCardDialogToAttackAction(),
      icon: FontAwesomeIcons.gavel,
    );
  }

  factory PlayCardDialogAction.toDefence() {
    return PlayCardDialogAction._(
      name: Strings.speedDuelCardActionToDefence.get(),
      type: const PlayCardDialogToDefenceAction(),
      icon: FontAwesomeIcons.shieldAlt,
    );
  }

  factory PlayCardDialogAction.flip() {
    return PlayCardDialogAction._(
      name: Strings.speedDuelCardActionFlip.get(),
      type: const PlayCardDialogFlipAction(),
      icon: FontAwesomeIcons.undoAlt,
    );
  }

  factory PlayCardDialogAction.set() {
    return PlayCardDialogAction._(
      name: Strings.speedDuelCardActionSet.get(),
      type: const PlayCardDialogSetAction(),
      icon: FontAwesomeIcons.caretSquareDown,
    );
  }

  @override
  List<Object> get props => [
        name,
        icon,
        type,
      ];

  @override
  bool get stringify => true;
}
