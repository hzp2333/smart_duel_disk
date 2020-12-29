import 'package:auto_route/annotations.dart';
import 'package:smart_duel_disk/packages/features/feature_home/feature_home_impl/lib/src/deck/widgets/deck_screen_provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/feature_home_impl/lib/src/duel/widgets/duel_screen_provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/feature_home_impl/lib/src/home/widgets/home_screen_provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/feature_home_impl/lib/src/news/widgets/news_screen_provider.dart';

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
