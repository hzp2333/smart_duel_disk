import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_connectivity/lib/wrapper_connectivity.dart';

import 'models/onboarding_state.dart';

typedef RetryCallback = Future<void> Function();

@Injectable()
class OnboardingViewModel extends BaseViewModel {
  static const _tag = 'OnboardingViewModel';

  final AppRouter _router;
  final DataManager _dataManager;
  final CacheCardImagesUseCase _cacheCardImagesUseCase;
  final StringProvider _stringProvider;
  final ConnectivityProvider _connectivityProvider;

  final _onboardingState = BehaviorSubject<OnboardingState>();
  Stream<OnboardingState> get onboardingState => _onboardingState.stream;

  OnboardingViewModel(
    this._router,
    this._dataManager,
    this._cacheCardImagesUseCase,
    this._stringProvider,
    this._connectivityProvider,
    Logger logger,
  ) : super(logger);

  Future<void> init() async {
    logger.info(_tag, 'init()');

    await _ensureUserIsConnected();
    await _ensureSpeedDuelCardsAvailable();
    await _ensureCardImagesAvailable();

    _onboardingState.safeAdd(const OnboardingReady());
  }

  Future<void> _ensureUserIsConnected() async {
    logger.verbose(_tag, '_ensureUserIsConnected()');

    _onboardingState.safeAdd(const OnboardingConnecting());

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

  Future<void> _ensureSpeedDuelCardsAvailable() async {
    logger.verbose(_tag, '_ensureUserIsConnected()');

    _onboardingState.safeAdd(const OnboardingCachingCards());

    await _dataManager.getSpeedDuelCards();
    await _dataManager.getToken();

    final hasCache = _dataManager.hasSpeedDuelCardsCache();
    if (!hasCache) {
      await _showCardsCacheErrorDialog();
    }
  }

  Future<void> _showCardsCacheErrorDialog() async {
    logger.verbose(_tag, '_showCardsCacheErrorDialog()');

    final retry = await _router.showDialog(
      DialogConfig(
        title: _stringProvider.getString(LocaleKeys.general_error_dialog_title),
        description: _stringProvider.getString(LocaleKeys.onboarding_cards_cache_error_description),
        positiveButtonText: _stringProvider.getString(LocaleKeys.general_error_try_again),
        isDismissable: false,
      ),
    );

    if (retry ?? false) {
      await _ensureSpeedDuelCardsAvailable();
    }
  }

  Future<void> _ensureCardImagesAvailable() async {
    logger.verbose(_tag, '_ensureCardImagesAvailable()');

    await _cacheCardImagesUseCase();
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

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _onboardingState.close();

    super.dispose();
  }
}
