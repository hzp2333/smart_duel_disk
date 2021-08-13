import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart';

import 'models/connection_info_model.dart';

abstract class DuelStorageProvider {
  ConnectionInfoModel getConnectionInfo();
  Future<void> saveConnectionInfo(ConnectionInfoModel connectionInfo);
}

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
