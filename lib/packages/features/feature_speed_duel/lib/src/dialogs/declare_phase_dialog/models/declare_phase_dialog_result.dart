import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/models/speed_duel_dialog_result.dart';

abstract class DeclarePhaseDialogResult extends SpeedDuelDialogResult {
  const DeclarePhaseDialogResult() : super();
}

class DeclarePhaseDeclaration extends DeclarePhaseDialogResult {
  final DuelPhaseType duelPhaseType;

  const DeclarePhaseDeclaration({
    required this.duelPhaseType,
  }) : super();

  @override
  List<Object?> get props => [
        ...super.props,
        duelPhaseType,
      ];
}

class DeclarePhaseEndTurn extends DeclarePhaseDialogResult {
  const DeclarePhaseEndTurn() : super();
}
