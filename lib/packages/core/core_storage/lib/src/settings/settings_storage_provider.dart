import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart';

abstract class SettingsStorageProvider {
  bool isDeveloperModeEnabled();
  Future<void> saveDeveloperModeEnabled({required bool value});
  double? getSoundEffectVolume();
  Future<void> saveSoundEffectVolume(double value);
}

@LazySingleton(as: SettingsStorageProvider)
class SettingsStorageProviderImpl implements SettingsStorageProvider {
  static const _developerModeEnabledKey = 'developerModeEnabled';
  static const _soundEffectVolumeKey = 'soundEffectVolume';

  final SharedPreferencesProvider _sharedPreferencesProvider;

  SettingsStorageProviderImpl(
    this._sharedPreferencesProvider,
  );

  @override
  bool isDeveloperModeEnabled() => _sharedPreferencesProvider.getBool(_developerModeEnabledKey);

  @override
  Future<void> saveDeveloperModeEnabled({required bool value}) =>
      _sharedPreferencesProvider.setBool(_developerModeEnabledKey, value: value);

  @override
  double? getSoundEffectVolume() => _sharedPreferencesProvider.getDouble(_soundEffectVolumeKey);

  @override
  Future<void> saveSoundEffectVolume(double value) =>
      _sharedPreferencesProvider.setDouble(_soundEffectVolumeKey, value);
}
