import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart';
import 'package:socket_io_client/socket_io_client.dart';

@Injectable(as: WebSocketProvider)
class WebSocketProviderImpl implements WebSocketProvider {
  final Socket _socket;

  WebSocketProviderImpl(
    this._socket,
  );

  @override
  void connect() {
    try {
      _socket.connect();
      _socket.on('connect', (dynamic _) => debugPrint('connect: ${_socket.id}'));
    } catch (e) {
      debugPrint('An error occurred while opening the socket: $e');
    }
  }

  @override
  bool isConnected() {
    return _socket.connected;
  }

  @override
  void emitEvent(String eventName, Map<String, dynamic> data) {
    _socket.emit(eventName, data);
  }

  @override
  void dispose() {
    _socket.dispose();
  }
}
