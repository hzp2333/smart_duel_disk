import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preferences_interface/shared_preferences_provider.dart';

@LazySingleton(as: SharedPreferencesProvider)
class SharedPreferencesProviderImpl implements SharedPreferencesProvider {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesProviderImpl(
    this._sharedPreferences,
  );

  @override
  bool containsKey(String key) => _sharedPreferences.containsKey(key);

  @override
  bool getBool(String key, {bool defaultValue = false}) => _sharedPreferences.getBool(key) ?? defaultValue;

  @override
  int getInt(String key) => _sharedPreferences.getInt(key);

  @override
  double getDouble(String key) => _sharedPreferences.getDouble(key);

  @override
  String getString(String key) => _sharedPreferences.getString(key);

  @override
  List<String> getStringList(String key) => _sharedPreferences.getStringList(key);

  @override
  Future<bool> setBool(String key, {bool value}) => _sharedPreferences.setBool(key, value);

  @override
  Future<bool> setInt(String key, int value) => _sharedPreferences.setInt(key, value);

  @override
  Future<bool> setDouble(String key, double value) => _sharedPreferences.setDouble(key, value);

  @override
  Future<bool> setString(String key, String value) => _sharedPreferences.setString(key, value);

  @override
  Future<bool> setStringList(String key, List<String> value) => _sharedPreferences.setStringList(key, value);

  @override
  Future<bool> remove(String key) => _sharedPreferences.remove(key);

  @override
  Future<bool> clear() => _sharedPreferences.clear();
}
