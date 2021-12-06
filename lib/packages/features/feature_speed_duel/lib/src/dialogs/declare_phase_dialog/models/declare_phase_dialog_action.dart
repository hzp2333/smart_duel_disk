import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/models/speed_duel_dialog_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/declare_phase_dialog/models/declare_phase_dialog_result.dart';

abstract class DeclarePhaseDialogAction extends SpeedDuelDialogAction {
  final Color iconColor;
  final bool enabled;
  final bool selected;

  const DeclarePhaseDialogAction({
    required String name,
    required IconData icon,
    required DeclarePhaseDialogResult result,
    required this.iconColor,
    required this.enabled,
    required this.selected,
  }) : super(
          name: name,
          icon: icon,
          result: result,
        );

  @override
  List<Object?> get props => [
        ...super.props,
        enabled,
        selected,
      ];
}

class DrawPhaseAction extends DeclarePhaseDialogAction {
  DrawPhaseAction({
    required bool enabled,
    required bool selected,
  }) : super(
          name: DuelPhaseType.drawPhase.shortName,
          icon: FontAwesomeIcons.creditCard,
          result: const DeclarePhaseDeclaration(duelPhaseType: DuelPhaseType.drawPhase),
          iconColor: Colors.brown,
          enabled: enabled,
          selected: selected,
        );
}

class StandbyPhaseAction extends DeclarePhaseDialogAction {
  StandbyPhaseAction({
    required bool enabled,
    required bool selected,
  }) : super(
          name: DuelPhaseType.standbyPhase.shortName,
          icon: FontAwesomeIcons.userClock,
          result: const DeclarePhaseDeclaration(duelPhaseType: DuelPhaseType.standbyPhase),
          iconColor: Colors.brown.shade300,
          enabled: enabled,
          selected: selected,
        );
}

class MainPhase1Action extends DeclarePhaseDialogAction {
  MainPhase1Action({
    required bool enabled,
    required bool selected,
  }) : super(
          name: DuelPhaseType.mainPhase1.shortName,
          icon: FontAwesomeIcons.handSparkles,
          result: const DeclarePhaseDeclaration(duelPhaseType: DuelPhaseType.mainPhase1),
          iconColor: Colors.brown.shade300,
          enabled: enabled,
          selected: selected,
        );
}

class BattlePhaseAction extends DeclarePhaseDialogAction {
  BattlePhaseAction({
    required bool enabled,
    required bool selected,
  }) : super(
          name: DuelPhaseType.battlePhase.shortName,
          icon: FontAwesomeIcons.gavel,
          result: const DeclarePhaseDeclaration(duelPhaseType: DuelPhaseType.battlePhase),
          iconColor: Colors.brown.shade800,
          enabled: enabled,
          selected: selected,
        );
}

class EndPhaseAction extends DeclarePhaseDialogAction {
  EndPhaseAction({
    required bool enabled,
    required bool selected,
  }) : super(
          name: DuelPhaseType.endPhase.shortName,
          icon: FontAwesomeIcons.handHolding,
          result: const DeclarePhaseDeclaration(duelPhaseType: DuelPhaseType.endPhase),
          iconColor: Colors.brown.shade300,
          enabled: enabled,
          selected: selected,
        );
}
