import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class DuelViewModel extends BaseViewModel {
  static const _tag = 'DuelViewModel';

  final RouterHelper _router;
  final DataManager _dataManager;

  DuelViewModel(
    Logger logger,
    this._router,
    this._dataManager,
  ) : super(
          logger,
        );

  Future<void> onSpeedDuelDemoPressed() async {
    logger.info(_tag, 'onSpeedDuelDemoPressed()');

    if (_dataManager.getConnectionInfo() == null) {
      
    }

    return _router.showSpeedDuel(PreBuiltDeck.yugi);
  }
}
