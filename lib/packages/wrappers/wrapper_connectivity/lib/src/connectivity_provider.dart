import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';

abstract class ConnectivityProvider {
  Future<bool> isConnected();
  Future<bool> hasWifi();
  Future<void> dispose();
}

@Singleton(as: ConnectivityProvider)
class ConnectivityProviderImpl implements ConnectivityProvider {
  final Connectivity _connectivity;

  final _connectivityResult = BehaviorSubject<ConnectivityResult>.seeded(ConnectivityResult.none);
  late StreamSubscription<void> _connectivityListener;

  ConnectivityProviderImpl(
    this._connectivity,
  ) {
    _connectivityListener = _connectivity.onConnectivityChanged.listen(_connectivityResult.safeAdd);
  }

  @override
  Future<bool> isConnected() async {
    final connectivityResult = _connectivityResult.value;
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<bool> hasWifi() async {
    final connectivityResult = _connectivityResult.value;
    return connectivityResult == ConnectivityResult.wifi;
  }

  @override
  @disposeMethod
  Future<void> dispose() async {
    await _connectivityListener.cancel();
    await _connectivityResult.close();
  }
}
