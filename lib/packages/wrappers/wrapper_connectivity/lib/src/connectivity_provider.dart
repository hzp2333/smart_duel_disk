import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class ConnectivityProvider {
  Future<bool> isConnected();
  Future<bool> hasWifi();
}

@LazySingleton(as: ConnectivityProvider)
class ConnectivityProviderImpl implements ConnectivityProvider {
  final Connectivity _connectivity;

  ConnectivityProviderImpl(
    this._connectivity,
  );

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<bool> hasWifi() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi;
  }
}
