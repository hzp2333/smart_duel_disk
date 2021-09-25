import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_connectivity/lib/wrapper_connectivity.dart';

typedef RetryCallback = Future<void> Function();

@Injectable()
class OnboardingViewModel extends BaseViewModel {
  static const _tag = 'OnboardingViewModel';

  final AppRouter _router;
  final DataManager _dataManager;
  final StringProvider _stringProvider;
  final ConnectivityProvider _connectivityProvider;

  OnboardingViewModel(
    this._router,
    this._dataManager,
    this._stringProvider,
    this._connectivityProvider,
    Logger logger,
  ) : super(logger);

  Future<void> init() async {
    logger.info(_tag, 'init()');

    await _ensureUserIsConnected();
  }

  Future<void> _ensureUserIsConnected() async {
    logger.verbose(_tag, '_ensureUserIsConnected()');

    final connected = await _connectivityProvider.isConnected();
    if (!connected) {
      await _showNoConnectionDialog(_ensureUserIsConnected);
    }
  }

  Future<void> _showNoConnectionDialog(RetryCallback callback) async {
    logger.verbose(_tag, '_showNoConnectionDialog()');

    final retry = await _router.showDialog(
      DialogConfig(
        title: _stringProvider.getString(LocaleKeys.no_connection_dialog_title),
        description: _stringProvider.getString(LocaleKeys.no_connection_dialog_description),
        positiveButtonText: _stringProvider.getString(LocaleKeys.general_error_try_again),
        isDismissable: false,
      ),
    );

    if (retry ?? false) {
      await callback.call();
    }
  }

  Future<void> onInitiateLinkPressed() async {
    logger.info(_tag, 'onInitiateLinkPressed()');

    final connected = await _connectivityProvider.isConnected();
    if (!connected) {
      await _showNoConnectionDialog(onInitiateLinkPressed);
      return;
    }

    await _router.showHome();
  }
}
