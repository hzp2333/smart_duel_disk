import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart';
import 'package:socket_io_client/socket_io_client.dart';

@Injectable(as: WebSocketProvider)
class WebSocketProviderImpl implements WebSocketProvider {
  static const _tag = 'WebSocketProviderImpl';

  final Socket _socket;
  final Logger _logger;

  SmartDuelEventReceiver _receiver;

  WebSocketProviderImpl(
    this._socket,
    this._logger,
  );

  @override
  void init(SmartDuelEventReceiver receiver) {
    _logger.info(_tag, 'init()');

    _receiver = receiver;

    try {
      _registerGlobalHandlers();
      _registerRoomHandlers();

      _socket.connect();
    } catch (ex, stackTrace) {
      _logger.error(_tag, 'An error occurred while initializing the socket: $ex', ex, stackTrace);
    }
  }

  @override
  void emitEvent(String eventName, Map<String, dynamic> data) {
    _logger.info(_tag, 'emitEvent(eventName: $eventName, data: $data)');

    _socket.emit(eventName, data);
  }

  @override
  void dispose() {
    _logger.info(_tag, 'dispose()');

    _socket.dispose();
  }

  void _registerGlobalHandlers() {
    _logger.verbose(_tag, '_registerGlobalHandlers()');

    _socket.on('connect', (dynamic _) => _logger.debug(_tag, 'connect: ${_socket.id}'));
    _socket.on('connect_error', (dynamic _) => _logger.debug(_tag, 'connect_error: ${_socket.id}'));
    _socket.on('connect_timeout', (dynamic _) => _logger.debug(_tag, 'connect_timeout: ${_socket.id}'));
    _socket.on('connecting', (dynamic _) => _logger.debug(_tag, 'connecting: ${_socket.id}'));
    _socket.on('disconnect', (dynamic _) => _logger.debug(_tag, 'disconnect: ${_socket.id}'));
    _socket.on('error', (dynamic _) => _logger.debug(_tag, 'error: ${_socket.id}'));
    _socket.on('reconnect', (dynamic _) => _logger.debug(_tag, 'reconnect: ${_socket.id}'));
  }

  void _registerRoomHandlers() {
    _logger.verbose(_tag, '_registerRoomHandlers()');

    const scope = SmartDuelEventConstants.roomScope;

    _socket.on('$scope:${SmartDuelEventConstants.roomCreateAction}', (dynamic json) {
      _receiver.onEventReceived(scope, SmartDuelEventConstants.roomCreateAction, json);
    });

    _socket.on('$scope:${SmartDuelEventConstants.roomCloseAction}', (dynamic json) {
      _receiver.onEventReceived(scope, SmartDuelEventConstants.roomCloseAction, json);
    });

    _socket.on('$scope:${SmartDuelEventConstants.roomJoinAction}', (dynamic json) {
      _receiver.onEventReceived(scope, SmartDuelEventConstants.roomJoinAction, json);
    });
  }
}
