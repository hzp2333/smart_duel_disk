import 'package:auto_route/annotations.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'ScreenProvider,Route',
  routes: <AutoRoute>[
    AutoRoute<void>(
      page: HomeScreenProvider,
      initial: true,
      usesTabsRouter: true,
      children: [
        AutoRoute<void>(name: 'DuelTab', page: DuelScreenProvider),
        AutoRoute<void>(name: 'NewsTab', page: NewsScreenProvider),
        AutoRoute<void>(name: 'DeckTab', page: DeckScreenProvider),
      ],
    ),
  ],
)
class $AppRouter {}
