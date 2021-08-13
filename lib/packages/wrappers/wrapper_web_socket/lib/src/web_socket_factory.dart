import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart';
import 'package:smart_duel_disk/src/di/di.dart';

abstract class WebSocketFactory {
  WebSocketProvider createWebSocketProvider();
}

@LazySingleton(as: WebSocketFactory)
class WebSocketFactoryImpl implements WebSocketFactory {
  @override
  WebSocketProvider createWebSocketProvider() {
    return di.get<WebSocketProvider>();
  }
}
