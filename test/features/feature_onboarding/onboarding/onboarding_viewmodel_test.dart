import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart';

import '../../../testing/empty_mocks.dart';

void main() {
  OnboardingViewModel _viewModel;

  Logger _logger;
  AppRouter _router;
  DataManager _dataManager;

  setUp(() {
    _logger = MockLogger();
    _router = MockAppRouter();
    _dataManager = MockDataManager();

    _viewModel = OnboardingViewModel(
      _logger,
      _router,
      _dataManager,
    );
  });

  group('When onInitiateLinkPressed is called', () {
    test('then the home screen is shown', () async {
      await _viewModel.onInitiateLinkPressed();

      verify(_router.showHome()).called(1);
    });
  });
}
