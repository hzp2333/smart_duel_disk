import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart';

@Injectable()
class DuelViewModel extends BaseViewModel {
  static const _tag = 'DuelViewModel';

  final DuelFormValidators _duelFormValidators;
  final RouterHelper _router;
  final DataManager _dataManager;

  final _ipAddress = BehaviorSubject<String>();
  Stream<String> get ipAddress => _ipAddress.stream.transform(_duelFormValidators.ipAddressValidator);

  final _port = BehaviorSubject<String>();
  Stream<String> get port => _port.stream.transform(_duelFormValidators.portValidator);

  Stream<bool> get isFormValid => Rx.combineLatest2(_ipAddress, _port, (String ipAddress, String port) {
        return !ipAddress.isNullOrEmpty && !port.isNullOrEmpty;
      });

  DuelViewModel(
    Logger logger,
    this._duelFormValidators,
    this._router,
    this._dataManager,
  ) : super(logger) {
    _init();
  }

  void _init() {
    logger.verbose(_tag, '_init()');

    final connectionInfo = _dataManager.getConnectionInfo();
    if (connectionInfo == null) {
      return;
    }

    if (!connectionInfo.ipAddress.isNullOrEmpty) {
      logger.debug(_tag, 'IP address: ${connectionInfo.ipAddress}');
      _ipAddress.add(connectionInfo.ipAddress);
    }

    if (!connectionInfo.port.isNullOrEmpty) {
      logger.debug(_tag, 'Port: ${connectionInfo.port}');
      _port.add(connectionInfo.port);
    }
  }

  void onIpAddressChanged(String ipAddress) {
    logger.info(_tag, 'onIpAddressChanged($ipAddress)');

    _ipAddress.add(ipAddress.isNotEmpty && _duelFormValidators.isValidIpAddress(ipAddress) ? ipAddress : null);
  }

  void onIpAddressSubmitted(String ipAddress) {
    logger.info(_tag, 'onIpAddressSubmitted($ipAddress)');

    _ipAddress.add(ipAddress);
  }

  void onPortChanged(String port) {
    logger.info(_tag, 'onPortChanged($port)');

    _port.add(port.isNotEmpty && _duelFormValidators.isValidPort(port) ? port : null);
  }

  void onPortSubmitted(String port) {
    logger.info(_tag, 'onPortSubmitted($port)');

    _port.add(port);
  }

  Future<void> onSpeedDuelDemoPressed() async {
    logger.info(_tag, 'onSpeedDuelDemoPressed()');

    await _dataManager.saveConnectionInfo(ConnectionInfo(
      ipAddress: _ipAddress.value,
      port: _port.value,
    ));

    final deck = await _router.showSelectDeckDialog();
    if (deck == null) {
      return;
    }

    await _router.showSpeedDuel(deck);
  }

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _ipAddress?.close();
    _port?.close();

    super.dispose();
  }
}
