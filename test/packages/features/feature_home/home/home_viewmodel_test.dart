import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/home/home_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/home/models/home_tab.dart';

import '../../../../testing/mocks/shared.mocks.dart';

void main() {
  late HomeViewModel _viewModel;

  late MockAppRouter _router;
  late MockGetHomeTabsUseCase _getHomeTabsUseCase;
  late MockLogger _logger;

  final _homeTabs = [
    const NewsHomeTab(),
    DeckHomeTab(),
    const DuelHomeTab(),
  ];

  setUp(() {
    _router = MockAppRouter();
    _getHomeTabsUseCase = MockGetHomeTabsUseCase();
    _logger = MockLogger();

    when(_getHomeTabsUseCase()).thenReturn(_homeTabs);

    _viewModel = HomeViewModel(
      _router,
      _getHomeTabsUseCase,
      _logger,
    );
  });

  group('When the viewmodel is initialized', () {
    test('then the home tabs are fetched', () {
      _viewModel.init();

      verify(_getHomeTabsUseCase()).called(1);
    });

    test('then the home tabs are emitted', () {
      final observable = _viewModel.homeTabs;

      scheduleMicrotask(() {
        _viewModel.init();
      });

      expect(observable, emits(_homeTabs));
    });
  });

  test('When the user presses on the settings icon, then the user settings are shown', () async {
    await _viewModel.onShowUserSettingsPressed();

    verify(_router.showUserSettings()).called(1);
  });

  group('When dispose is called', () {
    test('then all streams emit their last value', () async {
      _viewModel.init();
      _viewModel.dispose();

      final tabs = await _viewModel.homeTabs.last;

      expect(tabs, _homeTabs);
    });
  });
}
