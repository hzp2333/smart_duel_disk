import 'models/connection_info_model.dart';

abstract class DuelStorageProvider {
  ConnectionInfoModel getConnectionInfo();
  Future<void> saveConnectionInfo(ConnectionInfoModel connectionInfo);
}
