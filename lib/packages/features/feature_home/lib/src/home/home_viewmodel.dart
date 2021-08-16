import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@Injectable()
class HomeViewModel extends BaseViewModel {
  static const _tag = 'HomeViewModel';

  final AppRouter _router;

  HomeViewModel(
    this._router,
    Logger logger,
  ) : super(logger);

  Future<void> onShowUserSettingsPressed() async {
    logger.info(_tag, 'onShowUserSettingsPressed');

    await _router.showUserSettings();
  }
}
