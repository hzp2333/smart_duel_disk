import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/src/guards/auth_guard.dart';
import '../auto_route_router.gr.dart';

@module
abstract class NavigationModule {
  @LazySingleton()
  AutoRouteRouter provideAutoRouteRouter(AuthGuard authGuard) {
    return AutoRouteRouter(
      authGuard: authGuard,
    );
  }
}
