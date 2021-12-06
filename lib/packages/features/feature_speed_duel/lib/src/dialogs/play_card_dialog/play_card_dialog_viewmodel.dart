import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/speed_duel_dialog_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/usecases/create_play_card_dialog_actions_use_case.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';

import 'models/play_card_dialog_action.dart';
import 'models/play_card_dialog_parameters.dart';

class PlayCardDialogViewModel extends SpeedDuelDialogViewModel<PlayCardDialogAction> {
  static const _tag = 'PlayCardDialogViewModel';

  final PlayCardDialogParameters _parameters;
  final CreatePlayCardDialogActionsUseCase _createPlayCardDialogActionsUseCase;

  PlayCardDialogViewModel(
    this._parameters,
    this._createPlayCardDialogActionsUseCase,
    DialogService dialogService,
    Logger logger,
  ) : super(
          dialogService,
          logger,
        );

  @override
  PlayCard getPlayCard() => _parameters.playCard;

  @override
  Iterable<PlayCardDialogAction> getDialogActions() {
    logger.info(_tag, 'getDialogActions()');

    if (!_parameters.showActions) {
      return [];
    }

    return _createPlayCardDialogActionsUseCase(
      _parameters.playCard,
      _parameters.newZone,
    );
  }

  @override
  void onDialogActionPressed(PlayCardDialogAction action) {
    logger.info(_tag, 'onDialogActionPressed(action: $action)');

    dialogService.popDialog(action.result);
  }
}
