// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import '../../packages/features/feature_home/lib/feature_home.dart' as _i2;
import '../../packages/features/feature_deck_builder/lib/feature_deck_builder.dart'
    as _i3;
import '../../packages/features/feature_yugioh_card_detail/lib/feature_yugioh_card_detail.dart'
    as _i4;
import '../../packages/features/feature_draw_card/lib/src/widgets/draw_card_screen_provider.dart'
    as _i5;
import 'package:flutter/material.dart' as _i6;
import '../../packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart'
    as _i7;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.HomeScreenProvider());
    },
    DeckBuilderRoute.name: (entry) {
      return _i1.AdaptivePage(
          entry: entry, child: _i3.DeckBuilderScreenProvider());
    },
    YugiohCardDetailRoute.name: (entry) {
      var route = entry.routeData.as<YugiohCardDetailRoute>();
      return _i1.AdaptivePage(
          entry: entry,
          child:
              _i4.YugiohCardDetailScreenProvider(yugiohCard: route.yugiohCard));
    },
    DrawCardRoute.name: (entry) {
      return _i1.AdaptivePage(
          entry: entry, child: _i5.DrawCardScreenProvider());
    },
    DuelTab.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.DuelScreenProvider());
    },
    NewsTab.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.NewsScreenProvider());
    },
    DeckTab.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.DeckScreenProvider());
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
            ]),
        _i1.RouteConfig<DeckBuilderRoute>(DeckBuilderRoute.name,
            path: '/deck-builder-screen-provider',
            routeBuilder: (_) => const DeckBuilderRoute()),
        _i1.RouteConfig<YugiohCardDetailRoute>(YugiohCardDetailRoute.name,
            path: '/yugioh-card-detail-screen-provider',
            routeBuilder: (match) => YugiohCardDetailRoute.fromMatch(match)),
        _i1.RouteConfig<DrawCardRoute>(DrawCardRoute.name,
            path: '/draw-card-screen-provider',
            routeBuilder: (_) => const DrawCardRoute())
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute({List<_i1.PageRouteInfo> children})
      : super(name, path: '/', initialChildren: children);

  HomeRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'HomeRoute';
}

class DeckBuilderRoute extends _i1.PageRouteInfo {
  const DeckBuilderRoute() : super(name, path: '/deck-builder-screen-provider');

  static const String name = 'DeckBuilderRoute';
}

class YugiohCardDetailRoute extends _i1.PageRouteInfo {
  YugiohCardDetailRoute({@_i6.required this.yugiohCard})
      : super(name,
            path: '/yugioh-card-detail-screen-provider',
            argProps: [yugiohCard]);

  YugiohCardDetailRoute.fromMatch(_i1.RouteMatch match)
      : yugiohCard = null,
        super.fromMatch(match);

  final _i7.YugiohCard yugiohCard;

  static const String name = 'YugiohCardDetailRoute';
}

class DrawCardRoute extends _i1.PageRouteInfo {
  const DrawCardRoute() : super(name, path: '/draw-card-screen-provider');

  static const String name = 'DrawCardRoute';
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
