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
      _registerCardHandlers();

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

    _receiver = null;

    _socket.dispose();
  }

  void _onEventReceived(String scope, String action, dynamic json) {
    _logger.verbose(_tag, '_onEventReceived(scope: $scope, action: $action, json: $json)');

    _receiver?.onEventReceived(scope, action, json);
  }

  void _registerGlobalHandlers() {
    _logger.verbose(_tag, '_registerGlobalHandlers()');

    const scope = SmartDuelEventConstants.globalScope;

    _socket.on(SmartDuelEventConstants.globalConnectAction, (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.globalConnectAction, json);
    });

    _socket.on(SmartDuelEventConstants.globalConnectErrorAction, (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.globalConnectErrorAction, json);
    });

    _socket.on(SmartDuelEventConstants.globalConnectTimeoutAction, (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.globalConnectTimeoutAction, json);
    });

    _socket.on(SmartDuelEventConstants.globalConnectingAction, (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.globalConnectingAction, json);
    });

    _socket.on(SmartDuelEventConstants.globalDisconnectAction, (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.globalDisconnectAction, json);
    });

    _socket.on(SmartDuelEventConstants.globalErrorAction, (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.globalErrorAction, json);
    });

    _socket.on(SmartDuelEventConstants.globalReconnectAction, (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.globalReconnectAction, json);
    });
  }

  void _registerRoomHandlers() {
    _logger.verbose(_tag, '_registerRoomHandlers()');

    const scope = SmartDuelEventConstants.roomScope;

    _socket.on('$scope:${SmartDuelEventConstants.roomCreateAction}', (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.roomCreateAction, json);
    });

    _socket.on('$scope:${SmartDuelEventConstants.roomCloseAction}', (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.roomCloseAction, json);
    });

    _socket.on('$scope:${SmartDuelEventConstants.roomJoinAction}', (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.roomJoinAction, json);
    });
  }

  void _registerCardHandlers() {
    _logger.verbose(_tag, '_registerCardHandlers()');

    const scope = SmartDuelEventConstants.cardScope;

    _socket.on('$scope:${SmartDuelEventConstants.cardPlayAction}', (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.cardPlayAction, json);
    });

    _socket.on('$scope:${SmartDuelEventConstants.cardRemoveAction}', (dynamic json) {
      _onEventReceived(scope, SmartDuelEventConstants.cardRemoveAction, json);
    });
  }
}
