import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/wrapper_web_socket_interface/lib/wrapper_web_socket_interface.dart';

@LazySingleton(as: SmartDuelServer)
class SmartDuelServerImpl implements SmartDuelServer, SmartDuelEventReceiver {
  static const _tag = 'SmartDuelServerImpl';

  final WebSocketFactory _webSocketFactory;
  final DataManager _dataManager;
  final Logger _logger;

  final _smartDuelEvents = PublishSubject<SmartDuelEvent>();
  @override
  Stream<SmartDuelEvent> get smartDuelEvents => _smartDuelEvents.stream;

  WebSocketProvider _socket;

  SmartDuelServerImpl(
    this._webSocketFactory,
    this._dataManager,
    this._logger,
  );

  @override
  void init() {
    _logger.info(_tag, 'init()');

    if (_socket != null) {
      return;
    }

    final connectionInfo = _dataManager.getConnectionInfo();
    _socket = _webSocketFactory.createWebSocketProvider(connectionInfo);
    _socket.init(this);
  }

  @override
  void emitEvent(SmartDuelEvent event) {
    _logger.info(_tag, 'emitEvent(event: $event)');

    _socket.emitEvent('${event.scope}:${event.action}', event.data?.toJson());
  }

  @override
  void onEventReceived(String scope, String action, dynamic json) {
    _logger.info(_tag, 'onEventReceived(scope: $scope, action: $action, json: $json)');

    switch (scope) {
      case SmartDuelEventConstants.globalScope:
        _handleGlobalEvent(action);
        break;
      case SmartDuelEventConstants.roomScope:
        _handleRoomEvent(action, json);
        break;
      case SmartDuelEventConstants.cardScope:
        _handleCardEvent(action, json);
        break;
    }
  }

  void _handleGlobalEvent(String status) {
    _logger.verbose(_tag, '_handleGlobalEvent(status: $status)');

    _smartDuelEvents.add(SmartDuelEvent.global(status));
  }

  void _handleRoomEvent(String action, dynamic json) {
    _logger.verbose(_tag, '_handleRoomEvent(action: $action), json: $json');

    // TODO: this can definitely be improved. Remove stringify in server?
    SmartDuelEventData data;
    if (json is String) {
      final dynamic map = jsonDecode(json);
      if (map is Map<String, dynamic>) {
        data = RoomEventData.fromJson(map);
      }
    } else if (json is Map<String, dynamic>) {
      data = RoomEventData.fromJson(json);
    }

    SmartDuelEvent event;
    switch (action) {
      case SmartDuelEventConstants.roomCreateAction:
        event = SmartDuelEvent.createRoom(data);
        break;
      case SmartDuelEventConstants.roomCloseAction:
        event = SmartDuelEvent.closeRoom(data);
        break;
      case SmartDuelEventConstants.roomJoinAction:
        event = SmartDuelEvent.joinRoom(data);
        break;
    }

    if (event != null && !_smartDuelEvents.isClosed) {
      _smartDuelEvents.add(event);
    }
  }

  void _handleCardEvent(String action, dynamic json) {
    _logger.verbose(_tag, '_handleCardEvent(action: $action), json: $json');

    // TODO: this can definitely be improved. Remove stringify in server?
    SmartDuelEventData data;
    if (json is String) {
      final dynamic map = jsonDecode(json);
      if (map is Map<String, dynamic>) {
        data = CardEventData.fromJson(map);
      }
    } else if (json is Map<String, dynamic>) {
      data = CardEventData.fromJson(json);
    }

    SmartDuelEvent event;
    switch (action) {
      case SmartDuelEventConstants.cardPlayAction:
        event = SmartDuelEvent.playCard(data);
        break;
      case SmartDuelEventConstants.cardRemoveAction:
        event = SmartDuelEvent.removeCard(data);
        break;
    }

    if (event != null && !_smartDuelEvents.isClosed) {
      _smartDuelEvents.add(event);
    }
  }

  @override
  void dispose() {
    _logger.info(_tag, 'dispose()');

    _socket?.dispose();
    _socket = null;
  }
}
