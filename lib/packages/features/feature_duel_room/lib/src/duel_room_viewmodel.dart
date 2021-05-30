import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/core_smart_duel_server_interface/lib/core_smart_duel_server_interface.dart';

import 'models/duel_room_state.dart';

@Injectable()
class DuelRoomViewModel extends BaseViewModel {
  static const _tag = 'DuelRoomViewModel';

  final PreBuiltDeck _preBuiltDeck;
  final RouterHelper _router;
  final SmartDuelServer _smartDuelServer;

  final _roomName = BehaviorSubject<String>();
  Stream<String> get roomName => _roomName.stream;

  final _duelRoomState = BehaviorSubject<DuelRoomState>.seeded(const DuelRoomConnecting());
  Stream<DuelRoomState> get roomState => _duelRoomState.stream;

  StreamSubscription<SmartDuelEvent> _smartDuelEventSubscription;
  bool _joinedRoomSuccessfully = false;

  DuelRoomViewModel(
    Logger logger,
    @factoryParam this._preBuiltDeck,
    this._router,
    this._smartDuelServer,
  ) : super(logger) {
    _init();
  }

  //region Lifecycle

  Future<bool> onWillPop() {
    logger.info(_tag, 'onWillPop()');

    return Future.value(true);
  }

  //endregion

  //region Initialization

  void _init() {
    logger.verbose(_tag, '_init()');

    _initSmartDuelEventSubscription();
  }

  void _initSmartDuelEventSubscription() {
    logger.verbose(_tag, '_initSmartDuelEventSubscription()');

    _smartDuelEventSubscription = _smartDuelServer.smartDuelEvents.listen(_onSmartDuelEventReceived);
    _smartDuelServer.init();
  }

  //endregion

  //region Form fields

  void onRoomNameChanged(String roomName) {
    logger.info(_tag, 'onRoomNameChanged($roomName)');

    _roomName.add(roomName);
  }

  void onRoomNameSubmitted(String roomName) {
    logger.info(_tag, 'onRoomNameSubmitted($roomName)');

    _roomName.add(roomName);
  }

  //endregion

  //region Send smart duel events

  void onCreateRoomPressed() {
    logger.info(_tag, 'onCreateRoomPressed()');

    _smartDuelServer.emitEvent(SmartDuelEvent.createRoom());
  }

  void onCloseRoomPressed() {
    logger.info(_tag, 'onCreateRoomPressed()');

    final state = _duelRoomState.value;
    if (state is DuelRoomCreate) {
      _smartDuelServer.emitEvent(SmartDuelEvent.closeRoom(RoomEventData(
        roomName: state.roomName,
      )));
    }
  }

  void onJoinRoomPressed() {
    logger.info(_tag, 'onJoinRoomPressed()');

    _smartDuelServer.emitEvent(SmartDuelEvent.joinRoom(RoomEventData(
      roomName: _roomName.value,
    )));
  }

  //endregion

  //region Receive smart duel events

  Future<void> _onSmartDuelEventReceived(SmartDuelEvent event) async {
    logger.verbose(_tag, '_onSmartDuelEventReceived(event: $event)');

    if (event.scope == SmartDuelEventConstants.globalScope) {
      _handleGlobalEvent(event);
      return;
    }

    if (event.scope == SmartDuelEventConstants.roomScope) {
      await _handleRoomEvent(event);
      return;
    }
  }

  //region Global events

  void _handleGlobalEvent(SmartDuelEvent event) {
    logger.verbose(_tag, '_handleGlobalEvent(event: $event)');

    switch (event.action) {
      case SmartDuelEventConstants.globalConnectAction:
        _handleConnectEvent();
        break;
      case SmartDuelEventConstants.globalConnectErrorAction:
      case SmartDuelEventConstants.globalConnectTimeoutAction:
      case SmartDuelEventConstants.globalDisconnectAction:
      case SmartDuelEventConstants.globalErrorAction:
        _handleErrorEvent(event.action);
        break;
    }
  }

  void _handleConnectEvent() {
    logger.verbose(_tag, '_handleConnectEvent()');

    _duelRoomState.add(const DuelRoomConnected());
  }

  void _handleErrorEvent(String error) {
    logger.verbose(_tag, '_handleErrorEvent(error: $error)');

    // TODO: add retry
    final errorMessage = 'Could not connect to Smart Duel Server\n\nReason: $error';
    _duelRoomState.add(DuelRoomError(errorMessage));
  }

  //endregion

  //region Room events

  Future<void> _handleRoomEvent(SmartDuelEvent event) async {
    logger.verbose(_tag, '_handleRoomEvent(event: $event)');

    final eventData = event.data;
    if (eventData is RoomEventData) {
      switch (event.action) {
        case SmartDuelEventConstants.roomCreateAction:
          _handleCreateRoomEvent(eventData);
          break;
        case SmartDuelEventConstants.roomCloseAction:
          _handleCloseRoomEvent(eventData);
          break;
        case SmartDuelEventConstants.roomJoinAction:
          await _handleJoinRoomEvent(eventData);
          break;
      }
    }
  }

  void _handleCreateRoomEvent(RoomEventData data) {
    logger.verbose(_tag, '_handleCreateRoomEvent(data: $data)');

    final roomName = data?.roomName;
    if (roomName == null) {
      _duelRoomState.add(const DuelRoomError('room name not found'));
      return;
    }

    _duelRoomState.add(DuelRoomCreate(data.roomName));
  }

  void _handleCloseRoomEvent(RoomEventData data) {
    logger.verbose(_tag, '_handleCloseRoomEvent(data: $data)');

    _duelRoomState.add(const DuelRoomConnected());
  }

  Future<void> _handleJoinRoomEvent(RoomEventData data) async {
    logger.verbose(_tag, '_handleJoinRoomEvent(data: $data)');

    if (data.ready) {
      _joinedRoomSuccessfully = true;
      await _router.showSpeedDuel(_preBuiltDeck);
      return;
    }

    // TODO: add retry
    final errorMessage = 'Could not connect to room ${data.roomName}\n\nReason: ${data.error.stringValue}';
    _duelRoomState.add(DuelRoomError(errorMessage));
  }

  //endregion

  //endregion

  //region Clean-up

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _cancelSmartDuelEventSubscription();

    if (!_joinedRoomSuccessfully) {
      _smartDuelServer.dispose();
    }

    _roomName.close();
    _duelRoomState.close();

    super.dispose();
  }

  void _cancelSmartDuelEventSubscription() {
    logger.verbose(_tag, '_cancelSmartDuelEventSubscription()');

    _smartDuelEventSubscription?.cancel();
    _smartDuelEventSubscription = null;
  }

  //endregion
}
