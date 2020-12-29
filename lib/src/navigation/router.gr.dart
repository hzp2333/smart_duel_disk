// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import '../../packages/features/feature_home/feature_home_impl/lib/src/home/widgets/home_screen_provider.dart'
    as _i2;
import '../../packages/features/feature_home/feature_home_impl/lib/src/duel/widgets/duel_screen_provider.dart'
    as _i3;
import '../../packages/features/feature_home/feature_home_impl/lib/src/news/widgets/news_screen_provider.dart'
    as _i4;
import '../../packages/features/feature_home/feature_home_impl/lib/src/deck/widgets/deck_screen_provider.dart'
    as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.HomeScreenProvider());
    },
    DuelTab.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.DuelScreenProvider());
    },
    NewsTab.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i4.NewsScreenProvider());
    },
    DeckTab.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i5.DeckScreenProvider());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<HomeRoute>(HomeRoute.name,
            path: '/',
            usesTabsRouter: true,
            routeBuilder: (match) => HomeRoute.fromMatch(match),
            children: [
              _i1.RouteConfig<DuelTab>(DuelTab.name,
                  path: 'duel-screen-provider',
                  routeBuilder: (_) => const DuelTab()),
              _i1.RouteConfig<NewsTab>(NewsTab.name,
                  path: 'news-screen-provider',
                  routeBuilder: (_) => const NewsTab()),
              _i1.RouteConfig<DeckTab>(DeckTab.name,
                  path: 'deck-screen-provider',
                  routeBuilder: (_) => const DeckTab())
            ])
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute({List<_i1.PageRouteInfo> children})
      : super(name, path: '/', initialChildren: children);

  HomeRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'HomeRoute';
}

class DuelTab extends _i1.PageRouteInfo {
  const DuelTab() : super(name, path: 'duel-screen-provider');

  static const String name = 'DuelTab';
}

class NewsTab extends _i1.PageRouteInfo {
  const NewsTab() : super(name, path: 'news-screen-provider');

  static const String name = 'NewsTab';
}

class DeckTab extends _i1.PageRouteInfo {
  const DeckTab() : super(name, path: 'deck-screen-provider');

  static const String name = 'DeckTab';
}
