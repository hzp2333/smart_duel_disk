import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class OnboardingViewModel extends BaseViewModel {
  static const _tag = 'OnboardingViewModel';

  final RouterHelper _router;
  final DataManager _dataManager;

  OnboardingViewModel(
    Logger logger,
    this._router,
    this._dataManager,
  ) : super(logger);

  Future<void> onInitiateLinkPressed() async {
    logger.info(_tag, 'onInitiateLinkPressed()');

    await _router.showHome();
  }
}
