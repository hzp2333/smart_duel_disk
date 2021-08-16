import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/home/home_viewmodel.dart';

import '../../../testing/empty_mocks.dart';

void main() {
  HomeViewModel _viewModel;

  AppRouter _router;
  Logger _logger;

  setUp(() {
    _router = MockAppRouter();
    _logger = MockLogger();

    _viewModel = HomeViewModel(
      _router,
      _logger,
    );
  });

  test('When the user presses on the settings icon, then the user settings are shown', () async {
    await _viewModel.onShowUserSettingsPressed();

    verify(_router.showUserSettings()).called(1);
  });
}
