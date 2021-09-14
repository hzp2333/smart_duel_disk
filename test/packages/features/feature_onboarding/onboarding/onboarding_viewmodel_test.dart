import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/features/feature_onboarding/lib/src/onboarding/onboarding_viewmodel.dart';

import '../../../../testing/mocks/shared.mocks.dart';

void main() {
  late OnboardingViewModel _viewModel;

  late MockAppRouter _router;
  late MockDataManager _dataManager;
  late MockLogger _logger;

  setUp(() {
    _router = MockAppRouter();
    _dataManager = MockDataManager();
    _logger = MockLogger();

    _viewModel = OnboardingViewModel(
      _router,
      _dataManager,
      _logger,
    );
  });

  group('When onInitiateLinkPressed is called', () {
    test('then the home screen is shown', () async {
      await _viewModel.onInitiateLinkPressed();

      verify(_router.showHome()).called(1);
    });
  });
}
