import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/src/models/user_setting_type.dart';
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../../testing/mocks/shared.mocks.dart';

void main() {
  late UserSettingsViewModel _viewModel;

  late MockAppRouter _appRouter;
  late MockAuthenticationService _authService;
  late MockDataManager _dataManager;
  late MockSnackBarService _snackBarService;
  late MockStringProvider _stringProvider;
  late MockLogger _logger;

  setUp(() {
    _appRouter = MockAppRouter();
    _authService = MockAuthenticationService();
    _dataManager = MockDataManager();
    _snackBarService = MockSnackBarService();
    _stringProvider = MockStringProvider();
    _logger = MockLogger();

    when(_dataManager.isDeveloperModeEnabled()).thenReturn(false);

    when(_stringProvider.getString(any))
        .thenAnswer((realInvocation) => realInvocation.positionalArguments[0].toString());

    when(_stringProvider.getString(any, any))
        .thenAnswer((realInvocation) => realInvocation.positionalArguments.join(', '));

    _viewModel = UserSettingsViewModel(
      _appRouter,
      _authService,
      _dataManager,
      _snackBarService,
      _stringProvider,
      _logger,
    );
  });

  group('When the viewmodel is initialized', () {
    test('then the isDeveloperModeEnabled setting is fetched', () {
      _viewModel.init();

      verify(_dataManager.isDeveloperModeEnabled()).called(1);
    });

    test('then the user settings are emitted', () {
      final observable = _viewModel.userSettings;

      scheduleMicrotask(() {
        _viewModel.init();
      });

      expect(
        observable,
        emits([
          SwitchSettingItem(
            titleId: 'user_setting_developer_mode_title',
            leadingIcon: Icons.developer_mode,
            type: UserSettingType.developerModeEnabled,
            value: false,
            onValueChanged: (_) => Future.value(),
          ),
        ]),
      );
    });
  });

  group('When the value of the isDeveloperModeEnabled setting is changed', () {
    test('then the new value is saved', () async {
      _viewModel.init();

      await _viewModel.onDeveloperModeEnabledChanged(true);

      verify(_dataManager.saveDeveloperModeEnabled(value: true)).called(1);
    });

    test('then a snackbar message is shown', () async {
      _viewModel.init();

      await _viewModel.onDeveloperModeEnabledChanged(true);
      verify(_snackBarService.showSnackBar('user_setting_developer_mode_update_message, [general_switch_on, null]'))
          .called(1);

      await _viewModel.onDeveloperModeEnabledChanged(false);
      verify(_snackBarService.showSnackBar('user_setting_developer_mode_update_message, [general_switch_off, null]'))
          .called(1);
    });

    test('then the updated user settings are emitted', () {
      final observable = _viewModel.userSettings;

      _viewModel.init();

      when(_dataManager.isDeveloperModeEnabled()).thenReturn(true);

      scheduleMicrotask(() async {
        await _viewModel.onDeveloperModeEnabledChanged(true);
      });

      expect(
        observable,
        emitsInOrder(<StreamMatcher>[
          emits([
            SwitchSettingItem(
              titleId: 'user_setting_developer_mode_title',
              leadingIcon: Icons.developer_mode,
              type: UserSettingType.developerModeEnabled,
              value: false,
              onValueChanged: (_) => Future.value(),
            ),
          ]),
          emits([
            SwitchSettingItem(
              titleId: 'user_setting_developer_mode_title',
              leadingIcon: Icons.developer_mode,
              type: UserSettingType.developerModeEnabled,
              value: true,
              onValueChanged: (_) => Future.value(),
            ),
          ])
        ]),
      );
    });
  });
}
