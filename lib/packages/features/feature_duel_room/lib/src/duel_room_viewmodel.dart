import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_clipboard/lib/wrapper_clipboard.dart';

import 'models/duel_room_state.dart';

@Injectable()
class DuelRoomViewModel extends BaseViewModel {
  static const _tag = 'DuelRoomViewModel';

  late final PreBuiltDeck? _preBuiltDeck;
  final AppRouter _router;
  final SmartDuelServer _smartDuelServer;
  final DataManager _dataManager;
  final SnackBarService _snackBarService;
  final ClipboardProvider _clipboardProvider;

  final _roomName = BehaviorSubject<String>();
  Stream<String> get roomName => _roomName.stream;

  final _duelRoomState = BehaviorSubject<DuelRoomState>.seeded(const DuelRoomConnecting());
  Stream<DuelRoomState> get roomState => _duelRoomState.stream;

  StreamSubscription<SmartDuelEvent>? _smartDuelEventSubscription;
  bool _startedDuelSuccessfully = false;

  DuelRoomViewModel(
    @factoryParam this._preBuiltDeck,
    this._router,
    this._smartDuelServer,
    this._dataManager,
    this._snackBarService,
    this._clipboardProvider,
    Logger logger,
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

    _smartDuelEventSubscription = Rx.merge([
      _smartDuelServer.globalEvents,
      _smartDuelServer.roomEvents,
    ]).listen(_onSmartDuelEventReceived);

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

  Future<void> onCreateRoomPressed() async {
    logger.info(_tag, 'onCreateRoomPressed()');

    final deckList = await _dataManager.getPreBuiltDeckCardIds(_preBuiltDeck!);

    _smartDuelServer.emitEvent(
      SmartDuelEvent.createRoom(
        RoomEventData(
          deckList: deckList,
        ),
      ),
    );
  }

  void onCopyRoomCodePressed() {
    logger.info(_tag, 'onCopyRoomCodePressed()');

    final state = _duelRoomState.value;
    if (state is DuelRoomCreate) {
      _clipboardProvider.copyToClipboard(state.roomName);
      _snackBarService.showSnackBar('Room code copied to clipboard!');
    }
  }

  void onCloseRoomPressed() {
    logger.info(_tag, 'onCreateRoomPressed()');

    final state = _duelRoomState.value;
    if (state is DuelRoomCreate) {
      _smartDuelServer.emitEvent(
        SmartDuelEvent.closeRoom(
          RoomEventData(
            roomName: state.roomName,
          ),
        ),
      );
    }
  }

  Future<void> onJoinRoomPressed() async {
    logger.info(_tag, 'onJoinRoomPressed()');

    if (_roomName.valueOrNull.isNullOrEmpty) {
      _snackBarService.showSnackBar('Room name is required');
      return;
    }

    final deckList = await _dataManager.getPreBuiltDeckCardIds(_preBuiltDeck!);

    _smartDuelServer.emitEvent(
      SmartDuelEvent.joinRoom(
        RoomEventData(
          roomName: _roomName.value,
          deckList: deckList,
        ),
      ),
    );
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

    final errorMessage = 'Could not connect to Smart Duel Server\n\nReason: $error';
    _duelRoomState.add(DuelRoomError(errorMessage, _resetSmartDuelServerConnection));
  }

  void _resetSmartDuelServerConnection() {
    logger.verbose(_tag, '_resetSmartDuelServerConnection()');

    _smartDuelServer.dispose();
    _smartDuelServer.init();
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
        case SmartDuelEventConstants.roomStartAction:
          await _handleStartRoomEvent(eventData);
          break;
      }
    }
  }

  void _handleCreateRoomEvent(RoomEventData data) {
    logger.verbose(_tag, '_handleCreateRoomEvent(data: $data)');

    final roomName = data.roomName;
    if (roomName == null) {
      _duelRoomState.add(DuelRoomError('room name not found', _resetSmartDuelServerConnection));
      return;
    }

    _duelRoomState.add(DuelRoomCreate(data.roomName!));
  }

  void _handleCloseRoomEvent(RoomEventData data) {
    logger.verbose(_tag, '_handleCloseRoomEvent(data: $data)');

    _resetToConnectedState();
  }

  Future<void> _handleJoinRoomEvent(RoomEventData data) async {
    logger.verbose(_tag, '_handleJoinRoomEvent(data: $data)');

    final errorMessage = 'Could not connect to room ${data.roomName}\n\nReason: ${data.error.stringValue}';
    _duelRoomState.add(DuelRoomError(errorMessage, _resetToConnectedState));
  }

  Future<void> _handleStartRoomEvent(RoomEventData data) async {
    logger.verbose(_tag, '_handleStartRoomEvent(data: $data)');

    final duelRoom = data.duelRoom;
    if (duelRoom == null) {
      const errorMessage = 'Could not connect to room\n\nReason: could not parse duel room data';
      _duelRoomState.add(DuelRoomError(errorMessage, _resetToConnectedState));
      return;
    }

    _startedDuelSuccessfully = true;
    await _router.showSpeedDuel(duelRoom);
  }

  void _resetToConnectedState() {
    logger.verbose(_tag, '_resetToConnectedState()');

    _duelRoomState.add(const DuelRoomConnected());
  }

  //endregion

  //endregion

  //region Clean-up

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _cancelSmartDuelEventSubscription();

    if (!_startedDuelSuccessfully) {
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
