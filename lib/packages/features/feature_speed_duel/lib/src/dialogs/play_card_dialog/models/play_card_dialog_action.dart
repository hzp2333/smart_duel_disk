import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';

import 'play_card_dialog_action_type.dart';

@immutable
class PlayCardDialogAction extends Equatable {
  final String name;
  final IconData icon;
  final PlayCardDialogActionType type;

  const PlayCardDialogAction._({
    required this.name,
    required this.icon,
    required this.type,
  });

  factory PlayCardDialogAction.summon() {
    return const PlayCardDialogAction._(
      name: LocaleKeys.speed_duel_card_action_summon,
      type: PlayCardDialogSummonAction(),
      icon: FontAwesomeIcons.caretSquareUp,
    );
  }

  factory PlayCardDialogAction.activate() {
    return const PlayCardDialogAction._(
      name: LocaleKeys.speed_duel_card_action_activate,
      type: PlayCardDialogActivateAction(),
      icon: FontAwesomeIcons.fireAlt,
    );
  }

  factory PlayCardDialogAction.toAttack() {
    return const PlayCardDialogAction._(
      name: LocaleKeys.speed_duel_card_action_to_attack,
      type: PlayCardDialogToAttackAction(),
      icon: FontAwesomeIcons.gavel,
    );
  }

  factory PlayCardDialogAction.summonAttack() {
    return const PlayCardDialogAction._(
      name: LocaleKeys.speed_duel_card_action_summon_attack,
      type: PlayCardDialogSummonAttackAction(),
      icon: FontAwesomeIcons.gavel,
    );
  }

  factory PlayCardDialogAction.toDefence() {
    return const PlayCardDialogAction._(
      name: LocaleKeys.speed_duel_card_action_to_defence,
      type: PlayCardDialogToDefenceAction(),
      icon: FontAwesomeIcons.shieldAlt,
    );
  }

  factory PlayCardDialogAction.summonDefence() {
    return const PlayCardDialogAction._(
      name: LocaleKeys.speed_duel_card_action_summon_defence,
      type: PlayCardDialogSummonDefenceAction(),
      icon: FontAwesomeIcons.shieldAlt,
    );
  }

  factory PlayCardDialogAction.flip() {
    return const PlayCardDialogAction._(
      name: LocaleKeys.speed_duel_card_action_flip,
      type: PlayCardDialogFlipAction(),
      icon: FontAwesomeIcons.undoAlt,
    );
  }

  factory PlayCardDialogAction.set() {
    return const PlayCardDialogAction._(
      name: LocaleKeys.speed_duel_card_action_set,
      type: PlayCardDialogSetAction(),
      icon: FontAwesomeIcons.caretSquareDown,
    );
  }

  factory PlayCardDialogAction.destroy() {
    return const PlayCardDialogAction._(
      name: LocaleKeys.speed_duel_card_action_destroy,
      type: PlayCardDialogDestroyAction(),
      icon: FontAwesomeIcons.bomb,
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
