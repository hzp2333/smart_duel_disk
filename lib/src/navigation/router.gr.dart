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
import '../../packages/features/feature_draw_card/lib/feature_draw_card.dart'
    as _i5;
import '../../packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i6;
import 'package:flutter/material.dart' as _i7;
import '../../packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart'
    as _i8;

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
    SpeedDuelRoute.name: (entry) {
      return _i1.AdaptivePage(
          entry: entry, child: _i6.SpeedDuelScreenProvider());
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
                  routeBuilder: (match) => DuelTab.fromMatch(match)),
              _i1.RouteConfig<NewsTab>(NewsTab.name,
                  path: 'news-screen-provider',
                  routeBuilder: (match) => NewsTab.fromMatch(match)),
              _i1.RouteConfig<DeckTab>(DeckTab.name,
                  path: 'deck-screen-provider',
                  routeBuilder: (match) => DeckTab.fromMatch(match))
            ]),
        _i1.RouteConfig<DeckBuilderRoute>(DeckBuilderRoute.name,
            path: '/deck-builder-screen-provider',
            routeBuilder: (match) => DeckBuilderRoute.fromMatch(match)),
        _i1.RouteConfig<YugiohCardDetailRoute>(YugiohCardDetailRoute.name,
            path: '/yugioh-card-detail-screen-provider',
            routeBuilder: (match) => YugiohCardDetailRoute.fromMatch(match)),
        _i1.RouteConfig<DrawCardRoute>(DrawCardRoute.name,
            path: '/draw-card-screen-provider',
            routeBuilder: (match) => DrawCardRoute.fromMatch(match)),
        _i1.RouteConfig<SpeedDuelRoute>(SpeedDuelRoute.name,
            path: '/speed-duel-screen-provider',
            routeBuilder: (match) => SpeedDuelRoute.fromMatch(match))
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

  DeckBuilderRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'DeckBuilderRoute';
}

class YugiohCardDetailRoute extends _i1.PageRouteInfo {
  YugiohCardDetailRoute({@_i7.required this.yugiohCard})
      : super(name, path: '/yugioh-card-detail-screen-provider');

  YugiohCardDetailRoute.fromMatch(_i1.RouteMatch match)
      : yugiohCard = null,
        super.fromMatch(match);

  final _i8.YugiohCard yugiohCard;

  static const String name = 'YugiohCardDetailRoute';
}

class DrawCardRoute extends _i1.PageRouteInfo {
  const DrawCardRoute() : super(name, path: '/draw-card-screen-provider');

  DrawCardRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'DrawCardRoute';
}

class SpeedDuelRoute extends _i1.PageRouteInfo {
  const SpeedDuelRoute() : super(name, path: '/speed-duel-screen-provider');

  SpeedDuelRoute.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'SpeedDuelRoute';
}

class DuelTab extends _i1.PageRouteInfo {
  const DuelTab() : super(name, path: 'duel-screen-provider');

  DuelTab.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'DuelTab';
}

class NewsTab extends _i1.PageRouteInfo {
  const NewsTab() : super(name, path: 'news-screen-provider');

  NewsTab.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'NewsTab';
}

class DeckTab extends _i1.PageRouteInfo {
  const DeckTab() : super(name, path: 'deck-screen-provider');

  DeckTab.fromMatch(_i1.RouteMatch match) : super.fromMatch(match);

  static const String name = 'DeckTab';
}
