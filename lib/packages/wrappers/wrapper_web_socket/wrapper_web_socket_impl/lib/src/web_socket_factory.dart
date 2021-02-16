import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart';
import 'package:smart_duel_disk/src/di/di.dart';

@LazySingleton(as: WebSocketFactory)
class WebSocketFactoryImpl implements WebSocketFactory {
  @override
  WebSocketProvider createWebSocketProvider(ConnectionInfo connectionInfo) {
    return di.get<WebSocketProvider>(param1: connectionInfo);
  }
}
