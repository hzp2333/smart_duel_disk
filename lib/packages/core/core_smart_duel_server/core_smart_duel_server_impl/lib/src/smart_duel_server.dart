import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart';

@LazySingleton(as: SmartDuelServer)
class SmartDuelServerImpl implements SmartDuelServer {
  static const _summonEventName = 'summonEvent';

  final WebSocketFactory _webSocketFactory;

  WebSocketProvider _socket;

  SmartDuelServerImpl(
    this._webSocketFactory,
  );

  @override
  void connect() {
    if (_socket != null) {
      throw Exception('There is already a socket that has not been closed yet!');
    }

    _socket = _webSocketFactory.createWebSocketProvider();
    _socket.connect();
  }

  @override
  void emitEvent(SummonDuelEvent duelEvent) {
    _socket.emitEvent(_summonEventName, duelEvent.toJson());
  }

  @override
  void dispose() {
    _socket?.dispose();
    _socket = null;
  }
}
