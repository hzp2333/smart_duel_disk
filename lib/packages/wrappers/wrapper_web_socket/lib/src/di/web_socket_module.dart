import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:socket_io_client/socket_io_client.dart';

const _httpPrefix = 'http://';
const _httpsPrefix = 'https://';

@module
abstract class SocketIoModule {
  @Injectable()
  Socket provideSocket(DataManager dataManager) {
    final connectionInfo = dataManager.getConnectionInfo()!;
    final prefix = connectionInfo.ipAddress.startsWith(_httpPrefix) || connectionInfo.ipAddress.startsWith(_httpsPrefix)
        ? ''
        : _httpPrefix;
    final uri = '$prefix${connectionInfo.ipAddress}:${connectionInfo.port}';

    return io(uri, OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());
  }
}
