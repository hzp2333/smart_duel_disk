import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/src/models/user_setting_type.dart';

import 'models/setting_item.dart';

@Injectable()
class UserSettingsViewModel extends BaseViewModel {
  static const _tag = 'UserSettingsViewModel';

  static const _userSettingTypes = [
    UserSettingType.developerModeEnabled,
  ];

  final DataManager _dataManager;
  final SnackBarService _snackBarService;
  final StringProvider _stringProvider;

  final _userSettings = BehaviorSubject<Iterable<SettingItem>>();
  Stream<Iterable<SettingItem>> get userSettings => _userSettings.stream;

  UserSettingsViewModel(
    this._dataManager,
    this._snackBarService,
    this._stringProvider,
    Logger logger,
  ) : super(logger);

  Future<void> init() async {
    logger.info(_tag, 'init()');

    var userSettings = _userSettingTypes.map((type) => type.toSettingItem()).toList();

    userSettings = _updateDeveloperModeEnabledSetting(userSettings);

    _userSettings.safeAdd(userSettings);
  }

  List<SettingItem> _updateDeveloperModeEnabledSetting(List<SettingItem> settings) {
    logger.verbose(_tag, '_updateDeveloperModeEnabledSetting()');

    final oldSetting = settings.firstWhere((setting) => setting.type == UserSettingType.developerModeEnabled);
    final oldSettingIndex = settings.indexOf(oldSetting);

    final developerModeEnabled = _dataManager.isDeveloperModeEnabled();
    final newSetting = SwitchSettingItem(
      titleId: oldSetting.titleId,
      leadingIcon: oldSetting.leadingIcon,
      type: oldSetting.type,
      value: developerModeEnabled,
      onValueChanged: onDeveloperModeEnabledChanged,
    );

    settings.remove(oldSetting);
    settings.insert(oldSettingIndex, newSetting);

    return settings;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> onDeveloperModeEnabledChanged(bool value) async {
    logger.info(_tag, 'onDeveloperModeEnabledChanged(value: $value)');

    await _dataManager.saveDeveloperModeEnabled(value: value);

    final settingStatus =
        _stringProvider.getString(value ? LocaleKeys.general_switch_on : LocaleKeys.general_switch_off);
    final message = _stringProvider.getString(LocaleKeys.user_setting_developer_mode_update_message, [settingStatus]);
    _snackBarService.showSnackBar(message);

    final currentUserSettings = _userSettings.value.toList();
    final updatedUserSettings = _updateDeveloperModeEnabledSetting(currentUserSettings);

    _userSettings.safeAdd(updatedUserSettings);
  }

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _userSettings.close();

    super.dispose();
  }
}
