import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/feature_speed_duel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/declare_phase_dialog/models/declare_phase_dialog_parameters.dart';

import 'models/declare_phase_dialog_action.dart';

class DeclarePhaseDialogViewModel extends BaseViewModel {
  static const _tag = 'DeclarePhaseDialogViewModel';

  final DeclarePhaseDialogParameters _parameters;
  final DialogService _dialogService;

  DeclarePhaseDialogViewModel(
    this._parameters,
    this._dialogService,
    Logger logger,
  ) : super(logger);

  Iterable<DeclarePhaseDialogAction> getDialogActions() {
    logger.info(_tag, 'getDialogActions()');

    final currentDuelPhaseType = _parameters.currentDuelPhaseType;
    const phases = DuelPhaseType.values;

    return [
      DrawPhaseAction(
        enabled: phases.indexOf(currentDuelPhaseType) <= phases.indexOf(DuelPhaseType.drawPhase),
        selected: currentDuelPhaseType == DuelPhaseType.drawPhase,
      ),
      StandbyPhaseAction(
        enabled: phases.indexOf(currentDuelPhaseType) <= phases.indexOf(DuelPhaseType.standbyPhase),
        selected: currentDuelPhaseType == DuelPhaseType.standbyPhase,
      ),
      MainPhase1Action(
        enabled: phases.indexOf(currentDuelPhaseType) <= phases.indexOf(DuelPhaseType.mainPhase1),
        selected: currentDuelPhaseType == DuelPhaseType.mainPhase1,
      ),
      BattlePhaseAction(
        enabled: phases.indexOf(currentDuelPhaseType) <= phases.indexOf(DuelPhaseType.battlePhase),
        selected: currentDuelPhaseType == DuelPhaseType.battlePhase,
      ),
      EndPhaseAction(
        enabled: phases.indexOf(currentDuelPhaseType) <= phases.indexOf(DuelPhaseType.endPhase),
        selected: currentDuelPhaseType == DuelPhaseType.endPhase,
      ),
    ];
  }

  void onActionPressed(DeclarePhaseDialogAction action) {
    logger.info(_tag, 'onActionPressed(action: action)');

    _dialogService.popDialog(action.result);
  }

  void onEndTurnPressed() {
    logger.info(_tag, 'onEndTurnPressed()');

    _dialogService.popDialog(const DeclarePhaseEndTurn());
  }
}
