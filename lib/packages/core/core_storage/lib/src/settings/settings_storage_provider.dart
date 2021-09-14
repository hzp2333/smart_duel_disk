import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart';

abstract class SettingsStorageProvider {
  bool isDeveloperModeEnabled();
  Future<void> saveDeveloperModeEnabled({required bool? value});
}

@LazySingleton(as: SettingsStorageProvider)
class SettingsStorageProviderImpl implements SettingsStorageProvider {
  static const _developerModeEnabledKey = 'developerModeEnabled';

  final SharedPreferencesProvider _sharedPreferencesProvider;

  SettingsStorageProviderImpl(
    this._sharedPreferencesProvider,
  );

  @override
  bool isDeveloperModeEnabled() => _sharedPreferencesProvider.getBool(_developerModeEnabledKey);

  @override
  Future<void> saveDeveloperModeEnabled({required bool? value}) =>
      _sharedPreferencesProvider.setBool(_developerModeEnabledKey, value: value);
}
