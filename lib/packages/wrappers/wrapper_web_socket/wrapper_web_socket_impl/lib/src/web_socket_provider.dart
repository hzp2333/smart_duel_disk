import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart';
import 'package:socket_io_client/socket_io_client.dart';

@Injectable(as: WebSocketProvider)
class WebSocketProviderImpl implements WebSocketProvider {
  static const _tag = 'WebSocketProviderImpl';

  final Socket _socket;
  final Logger _logger;

  WebSocketProviderImpl(
    this._socket,
    this._logger,
  );

  @override
  void connect() {
    try {
      _socket.on('connect', (dynamic _) => _logger.debug(_tag, 'connect: ${_socket.id}'));
      _socket.on('connect_error', (dynamic _) => _logger.debug(_tag, 'connect_error: ${_socket.id}'));
      _socket.on('connect_timeout', (dynamic _) => _logger.debug(_tag, 'connect_timeout: ${_socket.id}'));
      _socket.on('connecting', (dynamic _) => _logger.debug(_tag, 'connecting: ${_socket.id}'));
      _socket.on('disconnect', (dynamic _) => _logger.debug(_tag, 'disconnect: ${_socket.id}'));
      _socket.on('error', (dynamic _) => _logger.debug(_tag, 'error: ${_socket.id}'));
      _socket.on('reconnect', (dynamic _) => _logger.debug(_tag, 'reconnect: ${_socket.id}'));

      _socket.connect();
    } catch (ex, stackTrace) {
      _logger.error(_tag, 'An error occurred while opening the socket: $ex', ex, stackTrace);
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
