import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart';

@Injectable()
class DuelViewModel extends BaseViewModel {
  static const _tag = 'DuelViewModel';

  final DuelFormValidators _duelFormValidators;
  final AppRouter _router;
  final DataManager _dataManager;

  final _ipAddress = BehaviorSubject<String?>();
  Stream<String?> get ipAddress => _ipAddress.stream.transform(_duelFormValidators.ipAddressValidator);

  final _port = BehaviorSubject<String?>();
  Stream<String?> get port => _port.stream.transform(_duelFormValidators.portValidator);

  Stream<bool> get isFormValid => Rx.combineLatest2(
        _ipAddress,
        _port,
        (String? ipAddress, String? port) => !ipAddress.isNullOrEmpty && !port.isNullOrEmpty,
      );

  final bool _localDuelRoomAvailable;
  bool get isLocalDuelRoomAvailable => _localDuelRoomAvailable;

  DuelViewModel(
    this._duelFormValidators,
    this._router,
    this._dataManager,
    Logger logger,
  )   : _localDuelRoomAvailable = _dataManager.isDeveloperModeEnabled(),
        super(logger);

  //region Initialization

  void init() {
    logger.info(_tag, 'init()');

    _initForm();
  }

  void _initForm() {
    logger.verbose(_tag, '_initForm()');

    final connectionInfo = _dataManager.getConnectionInfo(forceLocalInfo: true);
    if (connectionInfo == null) {
      return;
    }

    if (!connectionInfo.ipAddress.isNullOrEmpty) {
      _ipAddress.safeAdd(connectionInfo.ipAddress);
    }

    if (!connectionInfo.port.isNullOrEmpty) {
      _port.safeAdd(connectionInfo.port);
    }
  }

  //endregion

  //region Form fields

  void onIpAddressChanged(String ipAddress) {
    logger.info(_tag, 'onIpAddressChanged($ipAddress)');

    _ipAddress.safeAdd(ipAddress.isNotEmpty && _duelFormValidators.isValidIpAddress(ipAddress) ? ipAddress : null);
  }

  void onIpAddressSubmitted(String ipAddress) {
    logger.info(_tag, 'onIpAddressSubmitted($ipAddress)');

    _ipAddress.safeAdd(ipAddress);
  }

  void onPortChanged(String port) {
    logger.info(_tag, 'onPortChanged($port)');

    _port.safeAdd(port.isNotEmpty && _duelFormValidators.isValidPort(port) ? port : null);
  }

  void onPortSubmitted(String port) {
    logger.info(_tag, 'onPortSubmitted($port)');

    _port.safeAdd(port);
  }

  //endregion

  //region Actions

  Future<void> onEnterOnlineDuelRoomPressed() async {
    logger.info(_tag, 'onEnterOnlineDuelRoomPressed()');

    await _dataManager.saveUseOnlineDuelRoom(value: true);

    await _selectDeckAndEnterDuelRoom();
  }

  Future<void> onEnterLocalDuelRoomPressed() async {
    logger.info(_tag, 'onEnterLocalDuelRoomPressed()');

    await _dataManager.saveConnectionInfo(
      ConnectionInfo(
        ipAddress: _ipAddress.value!,
        port: _port.value!,
      ),
    );

    await _dataManager.saveUseOnlineDuelRoom(value: false);

    await _selectDeckAndEnterDuelRoom();
  }

  Future<void> _selectDeckAndEnterDuelRoom() async {
    logger.verbose(_tag, '_selectDeckAndEnterDuelRoom()');

    final deck = await _router.showSelectDeckDialog();
    if (deck == null) {
      return;
    }

    await _router.showDuelRoom(deck);
  }

  //endregion

  //region Clean-up

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _ipAddress.close();
    _port.close();

    super.dispose();
  }

  //endregion
}
