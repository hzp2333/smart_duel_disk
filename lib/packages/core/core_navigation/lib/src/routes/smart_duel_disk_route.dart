import 'package:auto_route/auto_route.dart';

import '../guards/auth_guard.dart';

class SmartDuelDiskRoute<T> extends AdaptiveRoute<T> {
  const SmartDuelDiskRoute({
    bool initial = false,
    bool fullscreenDialog = false,
    bool maintainState = true,
    String? name,
    String? path,
    bool usesPathAsKey = false,
    bool fullMatch = false,
    required Type page,
    List<Type> guards = const [AuthGuard],
    List<AutoRoute>? children,
  }) : super(
          initial: initial,
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          path: path,
          usesPathAsKey: usesPathAsKey,
          name: name,
          fullMatch: fullMatch,
          page: page,
          guards: guards,
          children: children,
        );
}
