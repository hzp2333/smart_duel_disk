import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

abstract class ConnectivityProvider {
  Future<bool> isConnected();
  Future<bool> hasWifi();
}

@Singleton(as: ConnectivityProvider)
class ConnectivityProviderImpl implements ConnectivityProvider {
  final Connectivity _connectivity;

  ConnectivityProviderImpl(
    this._connectivity,
  );

  @override
  Future<bool> isConnected() async {
    // TODO: this currently doesn't work on macOS (https://github.com/fluttercommunity/plus_plugins/issues/434)
    if (Platform.isMacOS) {
      return true;
    }

    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<bool> hasWifi() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi;
  }
}
