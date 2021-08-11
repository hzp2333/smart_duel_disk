import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_storage/core_storage_interface/lib/core_storage_interface.dart';

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
    final model = _duelStorageProvider.getConnectionInfo();
    if (model == null) {
      return ConnectionInfo(
        ipAddress: _appConfig.smartDuelServerAddress,
        port: _appConfig.smartDuelServerPort,
      );
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
}
