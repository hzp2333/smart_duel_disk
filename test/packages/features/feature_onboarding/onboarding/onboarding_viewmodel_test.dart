import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart';

import '../../../../testing/mocks/shared.mocks.dart';
import '../../../../testing/test_utils.dart';

void main() {
  late OnboardingViewModel _viewModel;

  late MockAppRouter _router;
  late MockAuthenticationService _authService;
  late MockDataManager _dataManager;
  late MockAreAllCardImagesCachedUseCase _areAllCardImagesCachedUseCase;
  late MockCacheCardImagesUseCase _cacheCardImagesUseCase;
  late MockStringProvider _stringProvider;
  late MockConnectivityProvider _connectivityProvider;
  late MockLogger _logger;

  setUp(() {
    _router = MockAppRouter();
    _authService = MockAuthenticationService();
    _dataManager = MockDataManager();
    _areAllCardImagesCachedUseCase = MockAreAllCardImagesCachedUseCase();
    _cacheCardImagesUseCase = MockCacheCardImagesUseCase();
    _stringProvider = MockStringProvider();
    _connectivityProvider = MockConnectivityProvider();
    _logger = MockLogger();

    when(_stringProvider.getString(any))
        .thenAnswer((realInvocation) => realInvocation.positionalArguments.first.toString());

    when(_connectivityProvider.isConnected()).thenAnswer((_) => Future.value(true));

    when(_areAllCardImagesCachedUseCase()).thenAnswer((_) => Future.value(true));

    when(_router.showDialog(any)).thenAnswer((_) => Future.value(false));

    when(_authService.isSignedIn()).thenReturn(false);

    _viewModel = OnboardingViewModel(
      _router,
      _authService,
      _dataManager,
      _areAllCardImagesCachedUseCase,
      _cacheCardImagesUseCase,
      _stringProvider,
      _connectivityProvider,
      _logger,
    );
  });

  group('When the viewmodel is initialized', () {
    test(
      'then a check is done to see if the user is connected to the internet',
      () async {
        await _viewModel.init();

        verify(_connectivityProvider.isConnected()).called(1);
      },
    );

    group('and the user is not connected to the internet', () {
      setUp(() {
        when(_connectivityProvider.isConnected()).thenAnswer((_) => Future.value(false));
      });

      test('then the no connection dialog is shown', () async {
        await _viewModel.init();

        verify(
          _router.showDialog(
            const DialogConfig(
              title: LocaleKeys.no_connection_dialog_title,
              description: LocaleKeys.no_connection_dialog_description,
              positiveButtonText: LocaleKeys.general_error_try_again,
              isDismissable: false,
            ),
          ),
        ).called(1);
      });
    });
  });

  group('When onSignInPressed is called', () {
    test('then the sign in screen is shown', () async {
      await _viewModel.onSignInPressed();

      verify(_router.showSignIn()).called(1);
    });
  });

  group('When onInitiateLinkPressed is called', () {
    group('and the user is not connected to the internet', () {
      setUp(() {
        when(_connectivityProvider.isConnected()).thenAnswer((_) => Future.value(false));
      });

      test('then the no connection dialog is shown', () async {
        await _viewModel.onInitiateLinkPressed();

        verify(
          _router.showDialog(
            const DialogConfig(
              title: LocaleKeys.no_connection_dialog_title,
              description: LocaleKeys.no_connection_dialog_description,
              positiveButtonText: LocaleKeys.general_error_try_again,
              isDismissable: false,
            ),
          ),
        ).called(1);
      });

      group('and the user retries the connection check', () {
        setUp(() {
          when(_router.showDialog(any)).thenAnswer((_) => Future.value(true));
        });

        test('then another check is done to see if the user is connected to the internet', () async {
          // ignore: unawaited_futures
          _viewModel.onInitiateLinkPressed();
          await untilCalled(_router.showDialog(any));
          when(_connectivityProvider.isConnected()).thenAnswer((_) => Future.value(true));
          await delay();

          verify(_connectivityProvider.isConnected()).called(2);
        });
      });
    });

    group('and the user is connected to the internet', () {
      test('then the home screen is shown', () async {
        await _viewModel.onInitiateLinkPressed();

        verify(_router.showHome()).called(1);
      });
    });
  });
}
