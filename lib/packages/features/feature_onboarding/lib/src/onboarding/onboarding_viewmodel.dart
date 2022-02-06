import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
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
  final AuthenticationService _authService;
  final DataManager _dataManager;
  final AreAllCardImagesCachedUseCase _areAllCardImagesCachedUseCase;
  final CacheCardImagesUseCase _cacheCardImagesUseCase;
  final StringProvider _stringProvider;
  final ConnectivityProvider _connectivityProvider;

  final _onboardingState = BehaviorSubject<OnboardingState>();
  Stream<OnboardingState> get onboardingState => _onboardingState.stream;

  OnboardingViewModel(
    this._router,
    this._authService,
    this._dataManager,
    this._areAllCardImagesCachedUseCase,
    this._cacheCardImagesUseCase,
    this._stringProvider,
    this._connectivityProvider,
    Logger logger,
  ) : super(logger);

  Future<void> init() async {
    logger.info(_tag, 'init()');

    await _ensureUserIsConnected();
    await _ensureSpeedDuelCardsAvailable();
    await _showDownloadCardImagesDialogIfNecessary();

    await _ensureUserIsSignedIn();
  }

  //region Connectivity check

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

  //endregion

  //region Cards cache check

  Future<void> _ensureSpeedDuelCardsAvailable() async {
    logger.verbose(_tag, '_ensureUserIsConnected()');

    _onboardingState.safeAdd(const OnboardingCachingCards());

    try {
      await _dataManager.getSpeedDuelCards();
      await _dataManager.getToken();
      if (kDebugMode) {
        await _dataManager.getSpeedDuelCard(70095154); // Cyber Dragon
        await _dataManager.getSpeedDuelCard(21844576); // Elemental HERO Avian
        await _dataManager.getSpeedDuelCard(58932615); // Elemental HERO Burstinatrix
        await _dataManager.getSpeedDuelCard(35809262); // Elemental HERO Flame Wingman
      }

      final hasCache = _dataManager.hasSpeedDuelCardsCache();
      if (!hasCache) {
        await _showCardsCacheErrorDialog();
      }
    } catch (e, stackTrace) {
      logger.error(_tag, 'An error occurred while downloading the speed duel cards', e, stackTrace);

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

  //endregion

  //region Card images cache check

  Future<void> _showDownloadCardImagesDialogIfNecessary() async {
    logger.verbose(_tag, '_showDownloadCardImagesDialogIfNecessary()');

    final cardImagesCached = await _areAllCardImagesCachedUseCase();
    if (cardImagesCached) {
      return;
    }

    final downloadCardImages = await _router.showDialog(
      DialogConfig(
        title: _stringProvider.getString(LocaleKeys.onboarding_card_images_cache_dialog_title),
        description: _stringProvider.getString(LocaleKeys.onboarding_card_images_cache_dialog_description),
        positiveButtonText: _stringProvider.getString(LocaleKeys.general_dialog_yes),
        negativeButtonText: _stringProvider.getString(LocaleKeys.general_dialog_no),
        isDismissable: false,
      ),
    );

    if (downloadCardImages ?? false) {
      await _ensureCardImagesAvailable();
    }
  }

  Future<void> _ensureCardImagesAvailable() async {
    logger.verbose(_tag, '_ensureCardImagesAvailable()');

    try {
      final progressStream = await _cacheCardImagesUseCase();

      await progressStream
          .listen(
            (progress) => _onboardingState.safeAdd(OnboardingCachingCardImages(progress)),
            onError: _onCardImagesCacheError,
            cancelOnError: true,
          )
          .asFuture<void>();
    } catch (e, stackTrace) {
      await _onCardImagesCacheError(e, stackTrace);
    }
  }

  Future<void> _onCardImagesCacheError(Object exception, StackTrace stackTrace) async {
    logger.error(_tag, 'An error occurred while downloading the card images', exception, stackTrace);

    await _showCardImagesCacheErrorDialog();
  }

  Future<void> _showCardImagesCacheErrorDialog() async {
    logger.verbose(_tag, '_showCardImagesCacheErrorDialog()');

    final retry = await _router.showDialog(
      DialogConfig(
        title: _stringProvider.getString(LocaleKeys.general_error_dialog_title),
        description: _stringProvider.getString(LocaleKeys.onboarding_card_images_cache_error_description),
        positiveButtonText: _stringProvider.getString(LocaleKeys.general_error_try_again),
        isDismissable: false,
      ),
    );

    if (retry ?? false) {
      await _ensureCardImagesAvailable();
    }
  }

  //endregion

  //region Authentication check

  Future<void> _ensureUserIsSignedIn() async {
    logger.verbose(_tag, '_ensureUserIsSignedIn()');

    final signedIn = _authService.isSignedIn();
    _onboardingState.safeAdd(signedIn ? const OnboardingReady() : const OnboardingSignedOut());
  }

  //endregion

  //region Button actions

  Future<void> onSignInPressed() async {
    logger.info(_tag, 'onSignInPressed()');

    await _router.showSignIn();
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

  //endregion

  //region Clean-up

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _onboardingState.close();

    super.dispose();
  }

  //endregion
}
