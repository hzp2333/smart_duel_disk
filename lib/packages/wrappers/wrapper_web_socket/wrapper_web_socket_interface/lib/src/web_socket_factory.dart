import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart';

abstract class WebSocketFactory {
  WebSocketProvider createWebSocketProvider();
}
