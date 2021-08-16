import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/src/models/setting_item.dart';
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/src/models/user_setting_type.dart';
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/src/user_settings_viewmodel.dart';

import '../../../testing/empty_mocks.dart';

void main() {
  UserSettingsViewModel _viewModel;

  DataManager _dataManager;
  SnackBarService _snackBarService;
  Logger _logger;

  setUp(() {
    _dataManager = MockDataManager();
    _snackBarService = MockSnackBarService();
    _logger = MockLogger();

    when(_dataManager.isDeveloperModeEnabled()).thenReturn(false);

    _viewModel = UserSettingsViewModel(
      _dataManager,
      _snackBarService,
      _logger,
    );
  });

  group('When the viewmodel is initialized', () {
    test('then the isDeveloperModeEnabled setting is fetched', () async {
      await _viewModel.init();

      verify(_dataManager.isDeveloperModeEnabled()).called(1);
    });

    test('then the user settings are emitted', () {
      final observable = _viewModel.userSettings;

      scheduleMicrotask(() async {
        await _viewModel.init();
      });

      expect(
          observable,
          emits([
            SwitchSettingItem(
              title: 'Developer mode',
              leadingIcon: Icons.developer_mode,
              type: UserSettingType.developerModeEnabled,
              value: false,
              onValueChanged: (_) => Future.value(),
            ),
          ]));
    });
  });

  group('When the value of the isDeveloperModeEnabled setting is changed', () {
    test('then the new value is saved', () async {
      await _viewModel.init();

      await _viewModel.onDeveloperModeEnabledChanged(true);

      verify(_dataManager.saveDeveloperModeEnabled(value: true)).called(1);
    });

    test('then a snackbar message is shown', () async {
      await _viewModel.init();

      await _viewModel.onDeveloperModeEnabledChanged(true);

      verify(_snackBarService.showSnackBar('The developer mode has been turned on. Please restart the app.')).called(1);
    });

    test('then the updated user settings are emitted', () async {
      final observable = _viewModel.userSettings;

      await _viewModel.init();

      when(_dataManager.isDeveloperModeEnabled()).thenReturn(true);

      scheduleMicrotask(() async {
        await _viewModel.onDeveloperModeEnabledChanged(true);
      });

      expect(
          observable,
          emitsInOrder(<StreamMatcher>[
            emits([
              SwitchSettingItem(
                title: 'Developer mode',
                leadingIcon: Icons.developer_mode,
                type: UserSettingType.developerModeEnabled,
                value: false,
                onValueChanged: (_) => Future.value(),
              ),
            ]),
            emits([
              SwitchSettingItem(
                title: 'Developer mode',
                leadingIcon: Icons.developer_mode,
                type: UserSettingType.developerModeEnabled,
                value: true,
                onValueChanged: (_) => Future.value(),
              ),
            ])
          ]));
    });
  });
}
