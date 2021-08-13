import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:socket_io_client/socket_io_client.dart';

@module
abstract class SocketIoModule {
  @Injectable()
  Socket provideSocket(DataManager dataManager) {
    // TODO: make some improvements to this
    final connectionInfo = dataManager.getConnectionInfo();
    final prefix = connectionInfo.ipAddress.startsWith('http://') || connectionInfo.ipAddress.startsWith('https://')
        ? ''
        : 'http://';
    final uri = '$prefix${connectionInfo.ipAddress}:${connectionInfo.port}';

    return io(uri, OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());
  }
}
