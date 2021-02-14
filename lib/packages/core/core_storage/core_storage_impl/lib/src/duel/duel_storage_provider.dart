import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_storage/core_storage_interface/lib/core_storage_interface.dart';

import '../providers/shared_preferences/shared_preferences_interface/shared_preferences_provider.dart';

@LazySingleton(as: DuelStorageProvider)
class DuelStorageProviderImpl implements DuelStorageProvider {
  static const _connectionInfoKey = 'connectionInfo';

  final SharedPreferencesProvider _sharedPreferencesProvider;

  DuelStorageProviderImpl(
    this._sharedPreferencesProvider,
  );

  @override
  ConnectionInfoModel getConnectionInfo() {
    final connectionInfo = _sharedPreferencesProvider.getString(_connectionInfoKey);
    if (connectionInfo == null) {
      return null;
    }

    return ConnectionInfoModel.fromJson(json.decode(connectionInfo) as Map<String, dynamic>);
  }

  @override
  Future<void> saveConnectionInfo(ConnectionInfoModel connectionInfo) async {
    await _sharedPreferencesProvider.setString(_connectionInfoKey, json.encode(connectionInfo));
  }
}
