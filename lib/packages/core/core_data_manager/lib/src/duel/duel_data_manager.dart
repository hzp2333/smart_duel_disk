import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart';

import 'entities/connection_info.dart';

abstract class DuelDataManager {
  ConnectionInfo getConnectionInfo();
  Future<void> saveConnectionInfo(ConnectionInfo connectionInfo);
  bool useOnlineDuelRoom();
  Future<void> saveUseOnlineDuelRoom({@required bool value});
}

@LazySingleton(as: DuelDataManager)
class DuelDataManagerImpl implements DuelDataManager {
  final AppConfig _appConfig;
  final DuelStorageProvider _duelStorageProvider;

  DuelDataManagerImpl(
    this._appConfig,
    this._duelStorageProvider,
  );

  @override
  ConnectionInfo getConnectionInfo() {
    return useOnlineDuelRoom() ? _getOnlineConnectionInfo() : _getLocalConnectionInfo();
  }

  ConnectionInfo _getOnlineConnectionInfo() {
    return ConnectionInfo(
      ipAddress: _appConfig.smartDuelServerAddress,
      port: _appConfig.smartDuelServerPort,
    );
  }

  ConnectionInfo _getLocalConnectionInfo() {
    final model = _duelStorageProvider.getConnectionInfo();
    if (model == null) {
      return null;
    }

    return ConnectionInfo(
      ipAddress: model.ipAddress,
      port: model.port,
    );
  }

  @override
  Future<void> saveConnectionInfo(ConnectionInfo connectionInfo) {
    final model = ConnectionInfoModel(
      ipAddress: connectionInfo.ipAddress,
      port: connectionInfo.port,
    );

    return _duelStorageProvider.saveConnectionInfo(model);
  }

  @override
  bool useOnlineDuelRoom() {
    return _duelStorageProvider.useOnlineDuelRoom();
  }

  @override
  Future<void> saveUseOnlineDuelRoom({bool value}) {
    return _duelStorageProvider.saveUseOnlineDuelRoom(value: value);
  }
}
