import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';

@LazySingleton()
class AuthGuard extends AutoRouteGuard {
  final AuthenticationService _authService;

  AuthGuard(
    this._authService,
  );

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (_authService.isSignedIn()) {
      resolver.next();
      return;
    }

    await router.navigate(
      SignInRoute(onSignedIn: (isSignedIn) => resolver.next(isSignedIn)),
    );
  }
}
