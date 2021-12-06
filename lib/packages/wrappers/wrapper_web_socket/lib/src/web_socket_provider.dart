import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class WebSocketProvider {
  void init(SmartDuelEventReceiver receiver);
  String? get socketId;
  void emitEvent(String eventName, Map<String, dynamic>? data);
  void dispose();
}

@Injectable(as: WebSocketProvider)
class WebSocketProviderImpl implements WebSocketProvider {
  static const _tag = 'WebSocketProviderImpl';

  final Socket _socket;
  final Logger _logger;

  SmartDuelEventReceiver? _receiver;

  @override
  String? get socketId => _socket.id;

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
      _registerDeckHandlers();
      _registerDuelistHandlers();

      _socket.connect();
    } catch (ex, stackTrace) {
      _logger.error(_tag, 'An error occurred while initializing the socket: $ex', ex, stackTrace);
    }
  }

  @override
  void emitEvent(String eventName, Map<String, dynamic>? data) {
    _logger.info(_tag, 'emitEvent(eventName: $eventName, data: $data)');

    _socket.emit(eventName, data);
  }

  @override
  void dispose() {
    _logger.info(_tag, 'dispose()');

    _receiver = null;

    // If you call _socket.dispose(), it's not possible anymore to get the id of this socket or a 'new' socket instance.
    // We can use _socket.close() instead, but apparently this causes memory leak issues on iOS.
    // More info: https://github.com/rikulo/socket.io-client-dart/issues/194
    _socket.close();
  }

  // ignore: avoid_annotating_with_dynamic
  void _onEventReceived(String scope, String action, dynamic json) {
    _logger.verbose(_tag, '_onEventReceived(scope: $scope, action: $action, json: $json)');

    _receiver?.onEventReceived(scope, action, json);
  }

  void _registerHandler(String scope, String action) {
    final eventName = scope == SmartDuelEventConstants.globalScope ? action : '$scope:$action';

    // ignore: avoid_annotating_with_dynamic
    _socket.on(eventName, (dynamic json) {
      _onEventReceived(scope, action, json);
    });
  }

  void _registerGlobalHandlers() {
    _logger.verbose(_tag, '_registerGlobalHandlers()');

    const scope = SmartDuelEventConstants.globalScope;

    _registerHandler(scope, SmartDuelEventConstants.globalConnectAction);
    _registerHandler(scope, SmartDuelEventConstants.globalConnectErrorAction);
    _registerHandler(scope, SmartDuelEventConstants.globalConnectTimeoutAction);
    _registerHandler(scope, SmartDuelEventConstants.globalConnectingAction);
    _registerHandler(scope, SmartDuelEventConstants.globalDisconnectAction);
    _registerHandler(scope, SmartDuelEventConstants.globalErrorAction);
    _registerHandler(scope, SmartDuelEventConstants.globalReconnectAction);
  }

  void _registerRoomHandlers() {
    _logger.verbose(_tag, '_registerRoomHandlers()');

    const scope = SmartDuelEventConstants.roomScope;

    _registerHandler(scope, SmartDuelEventConstants.roomCreateAction);
    _registerHandler(scope, SmartDuelEventConstants.roomCloseAction);
    _registerHandler(scope, SmartDuelEventConstants.roomJoinAction);
    _registerHandler(scope, SmartDuelEventConstants.roomStartAction);
  }

  void _registerCardHandlers() {
    _logger.verbose(_tag, '_registerCardHandlers()');

    const scope = SmartDuelEventConstants.cardScope;

    _registerHandler(scope, SmartDuelEventConstants.cardPlayAction);
    _registerHandler(scope, SmartDuelEventConstants.cardRemoveAction);
    _registerHandler(scope, SmartDuelEventConstants.cardAttackAction);
    _registerHandler(scope, SmartDuelEventConstants.cardDeclareAction);
    _registerHandler(scope, SmartDuelEventConstants.cardAddCounterAction);
    _registerHandler(scope, SmartDuelEventConstants.cardRemoveCounterAction);
    _registerHandler(scope, SmartDuelEventConstants.cardRevealAction);
    _registerHandler(scope, SmartDuelEventConstants.cardHideAction);
    _registerHandler(scope, SmartDuelEventConstants.cardGiveToOpponentAction);
  }

  void _registerDeckHandlers() {
    _logger.verbose(_tag, '_registerDeckHandlers()');

    const scope = SmartDuelEventConstants.deckScope;

    _registerHandler(scope, SmartDuelEventConstants.deckShuffleAction);
  }

  void _registerDuelistHandlers() {
    _logger.verbose(_tag, '_registerDuelistHandlers()');

    const scope = SmartDuelEventConstants.duelistScope;

    _registerHandler(scope, SmartDuelEventConstants.duelistRollDiceAction);
    _registerHandler(scope, SmartDuelEventConstants.duelistFlipCoinAction);
    _registerHandler(scope, SmartDuelEventConstants.duelistDeclarePhaseAction);
    _registerHandler(scope, SmartDuelEventConstants.duelistEndTurnAction);
  }
}
