import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/src/entities/event_data/deck_event_data.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_web_socket/lib/wrapper_web_socket.dart';

import '../core_smart_duel_server.dart';

abstract class SmartDuelServer {
  void init();
  Stream<SmartDuelEvent> get globalEvents;
  Stream<SmartDuelEvent> get roomEvents;
  Stream<SmartDuelEvent> get cardEvents;
  Stream<SmartDuelEvent> get deckEvents;
  String? getDuelistId();
  void emitEvent(SmartDuelEvent event);
  void dispose();
}

@LazySingleton(as: SmartDuelServer)
class SmartDuelServerImpl implements SmartDuelServer, SmartDuelEventReceiver {
  static const _tag = 'SmartDuelServerImpl';

  final WebSocketFactory _webSocketFactory;
  final Logger _logger;

  final _globalEvents = PublishSubject<SmartDuelEvent>();
  @override
  Stream<SmartDuelEvent> get globalEvents => _globalEvents.stream;

  final _roomEvents = PublishSubject<SmartDuelEvent>();
  @override
  Stream<SmartDuelEvent> get roomEvents => _roomEvents.stream;

  ReplaySubject<SmartDuelEvent> _cardEvents = ReplaySubject<SmartDuelEvent>();
  @override
  Stream<SmartDuelEvent> get cardEvents => _cardEvents.stream;

  final _deckEvents = PublishSubject<SmartDuelEvent>();
  @override
  Stream<SmartDuelEvent> get deckEvents => _deckEvents.stream;

  WebSocketProvider? _socket;

  SmartDuelServerImpl(
    this._webSocketFactory,
    this._logger,
  );

  @override
  void init() {
    _logger.info(_tag, 'init()');

    if (_socket != null) {
      return;
    }

    _socket = _webSocketFactory.createWebSocketProvider();
    _socket!.init(this);
  }

  @override
  String? getDuelistId() {
    final duelistId = _socket?.socketId;
    _logger.info(_tag, 'Duelist ID: $duelistId');

    return duelistId;
  }

  @override
  void emitEvent(SmartDuelEvent event) {
    _logger.info(_tag, 'emitEvent(event: $event)');

    _socket!.emitEvent('${event.scope}:${event.action}', event.data?.toJson());
  }

  @override
  // ignore: avoid_annotating_with_dynamic
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
      case SmartDuelEventConstants.deckScope:
        _handleDeckEvent(action, json);
        break;
    }
  }

  void _handleGlobalEvent(String status) {
    _logger.verbose(_tag, '_handleGlobalEvent(status: $status)');

    if (!_globalEvents.isClosed) {
      _globalEvents.safeAdd(SmartDuelEvent.global(status));
    }
  }

  // ignore: avoid_annotating_with_dynamic
  void _handleRoomEvent(String action, dynamic json) {
    _logger.verbose(_tag, '_handleRoomEvent(action: $action), json: $json');

    SmartDuelEventData? data;
    if (json is Map<String, dynamic>) {
      data = RoomEventData.fromJson(json);
    }

    SmartDuelEvent? event;
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
      case SmartDuelEventConstants.roomStartAction:
        event = SmartDuelEvent.startRoom(data);
        break;
    }

    if (event != null && !_roomEvents.isClosed) {
      _roomEvents.safeAdd(event);
    }
  }

  // ignore: avoid_annotating_with_dynamic
  void _handleCardEvent(String action, dynamic json) {
    _logger.verbose(_tag, '_handleCardEvent(action: $action), json: $json');

    SmartDuelEventData? data;
    if (json is Map<String, dynamic>) {
      data = CardEventData.fromJson(json);
    }

    SmartDuelEvent? event;
    switch (action) {
      case SmartDuelEventConstants.cardPlayAction:
        event = SmartDuelEvent.playCard(data);
        break;
      case SmartDuelEventConstants.cardRemoveAction:
        event = SmartDuelEvent.removeCard(data);
        break;
      case SmartDuelEventConstants.cardAttackAction:
        event = SmartDuelEvent.attackCard(data);
        break;
      case SmartDuelEventConstants.cardDeclareAction:
        event = SmartDuelEvent.declareCard(data);
        break;
      case SmartDuelEventConstants.cardAddCounterAction:
        event = SmartDuelEvent.addCounterToCard(data);
        break;
      case SmartDuelEventConstants.cardRemoveCounterAction:
        event = SmartDuelEvent.removeCounterFromCard(data);
        break;
      case SmartDuelEventConstants.cardRevealAction:
        event = SmartDuelEvent.revealCard(data);
        break;
      case SmartDuelEventConstants.cardHideAction:
        event = SmartDuelEvent.hideCard(data);
        break;
    }

    if (event != null && !_cardEvents.isClosed) {
      _cardEvents.safeAdd(event);
    }
  }

  // ignore: avoid_annotating_with_dynamic
  void _handleDeckEvent(String action, dynamic json) {
    _logger.verbose(_tag, '_handleDeckEvent(action: $action), json: $json');

    SmartDuelEventData? data;
    if (json is Map<String, dynamic>) {
      data = DeckEventData.fromJson(json);
    }

    SmartDuelEvent? event;
    switch (action) {
      case SmartDuelEventConstants.deckShuffleAction:
        event = SmartDuelEvent.shuffleDeck(data);
        break;
    }

    if (event != null && !_deckEvents.isClosed) {
      _deckEvents.safeAdd(event);
    }
  }

  @override
  void dispose() {
    _logger.info(_tag, 'dispose()');

    _socket?.dispose();
    _socket = null;

    _cardEvents.close();
    _cardEvents = ReplaySubject<SmartDuelEvent>();
  }
}
