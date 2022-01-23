import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_auth/wrapper_auth.dart';

abstract class AuthenticationService {
  User? getUser();
  bool isSignedIn();
  void dispose();
}

@Singleton(as: AuthenticationService)
class AuthenticationServiceImpl implements AuthenticationService {
  static const _tag = 'AuthenticationServiceImpl';

  final AppRouter _router;
  final AuthProvider _authProvider;
  final Logger _logger;

  final _authState = BehaviorSubject<User?>();

  StreamSubscription<User?>? _authStateSubscription;

  AuthenticationServiceImpl(
    this._router,
    this._authProvider,
    this._logger,
  ) {
    _init();
  }

  void _init() {
    _logger.verbose(_tag, '_init()');

    _authStateSubscription = _authProvider.authStateChanges().listen(_authState.safeAdd);
  }

  @override
  User? getUser() {
    _logger.info(_tag, 'getUser()');

    return _authState.valueOrNull;
  }

  @override
  bool isSignedIn() {
    _logger.info(_tag, 'isSignedIn()');

    return getUser() != null;
  }

  @override
  @disposeMethod
  void dispose() {
    _logger.info(_tag, 'dispose()');

    _authStateSubscription?.cancel();

    _authState.close();
  }
}
