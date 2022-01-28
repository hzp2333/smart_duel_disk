import 'dart:async';

import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/src/logger.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

typedef SignInCallback = void Function(bool isSignedIn);

class SignInViewModel extends BaseViewModel {
  static const _tag = 'SignInViewModel';

  final SignInCallback? _onSignedIn;
  final AuthenticationService _authService;
  final AppRouter _router;

  StreamSubscription<User?>? _authStateSubscription;

  SignInViewModel(
    this._onSignedIn,
    this._authService,
    this._router,
    Logger logger,
  ) : super(logger);

  void init() {
    logger.info(_tag, 'init()');

    _authStateSubscription = _authService.authState.listen((_) async {
      final signedIn = _authService.isSignedIn();

      if (_onSignedIn != null) {
        _onSignedIn?.call(signedIn);
        return;
      }

      if (signedIn) {
        await _router.showHome();
      }
    });
  }

  @override
  void dispose() {
    logger.info(_tag, 'dispose()');

    _authStateSubscription?.cancel();

    super.dispose();
  }
}
