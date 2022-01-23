import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_auth/wrapper_auth.dart';

abstract class AuthenticationService {
  Stream<User?> get authState;
  User? getUser();
  bool isSignedIn();
  Future<void> signOut();
  void dispose();
}

@LazySingleton(as: AuthenticationService)
class AuthenticationServiceImpl implements AuthenticationService {
  static const _tag = 'AuthenticationServiceImpl';

  final AuthProvider _authProvider;
  final Logger _logger;

  @override
  Stream<User?> get authState => _authProvider.authStateChanges();

  User? _user;
  StreamSubscription<User?>? _authStateSubscription;

  AuthenticationServiceImpl(
    this._authProvider,
    this._logger,
  ) {
    _init();
  }

  void _init() {
    _logger.verbose(_tag, '_init()');

    _authStateSubscription = authState.listen((user) => _user = user);
  }

  @override
  User? getUser() {
    _logger.info(_tag, 'getUser()');

    return _user;
  }

  @override
  bool isSignedIn() {
    _logger.info(_tag, 'isSignedIn()');

    return getUser() != null;
  }

  @override
  Future<void> signOut() async {
    _logger.info(_tag, 'signOut()');

    await _authProvider.signOut();
  }

  @override
  @disposeMethod
  void dispose() {
    _logger.info(_tag, 'dispose()');

    _authStateSubscription?.cancel();
  }
}
