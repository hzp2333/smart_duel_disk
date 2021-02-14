import 'entities/connection_info.dart';

abstract class DuelDataManager {
  ConnectionInfo getConnectionInfo();
  Future<void> saveConnectionInfo(ConnectionInfo connectionInfo);
}
