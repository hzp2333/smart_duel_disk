import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';

abstract class SettingsDataManager {
  bool isDeveloperModeEnabled();
  Future<void> saveDeveloperModeEnabled({required bool? value});
}

@LazySingleton(as: SettingsDataManager)
class SettingsDataManagerImpl implements SettingsDataManager {
  final SettingsStorageProvider _settingsStorageProvider;

  SettingsDataManagerImpl(
    this._settingsStorageProvider,
  );

  @override
  bool isDeveloperModeEnabled() => _settingsStorageProvider.isDeveloperModeEnabled();

  @override
  Future<void> saveDeveloperModeEnabled({required bool? value}) =>
      _settingsStorageProvider.saveDeveloperModeEnabled(value: value);
}
