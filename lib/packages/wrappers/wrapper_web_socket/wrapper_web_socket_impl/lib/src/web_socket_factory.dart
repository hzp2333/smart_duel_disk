import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart';
import 'package:smart_duel_disk/src/di/di.dart';

@LazySingleton(as: WebSocketFactory)
class WebSocketFactoryImpl implements WebSocketFactory {
  @override
  WebSocketProvider createWebSocketProvider() {
    return di.get<WebSocketProvider>();
  }
}
