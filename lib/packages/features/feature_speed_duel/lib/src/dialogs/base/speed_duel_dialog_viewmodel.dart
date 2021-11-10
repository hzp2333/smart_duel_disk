import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';

import 'models/speed_duel_dialog_action.dart';

abstract class SpeedDuelDialogViewModel<T extends SpeedDuelDialogAction> extends BaseViewModel {
  final DialogService _dialogService;
  DialogService get dialogService => _dialogService;

  SpeedDuelDialogViewModel(
    this._dialogService,
    Logger logger,
  ) : super(logger);

  PlayCard getPlayCard();

  Iterable<T> getDialogActions();

  void onDialogActionPressed(T action);
}
