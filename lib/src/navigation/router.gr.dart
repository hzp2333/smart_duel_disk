// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i8;
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart'
    as _i7;
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/feature_deck_builder.dart'
    as _i3;
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/feature_draw_card.dart'
    as _i5;
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart'
    as _i2;
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i6;
import 'package:smart_duel_disk/packages/features/feature_yugioh_card_detail/lib/feature_yugioh_card_detail.dart'
    as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (entry) {
      return _i1.AdaptivePage(
          entry: entry,
          child: _i2.HomeScreenProvider(),
          maintainState: true,
          fullscreenDialog: false);
    },
    DeckBuilderRoute.name: (entry) {
      var route = entry.routeData.as<DeckBuilderRoute>();
      return _i1.AdaptivePage(
          entry: entry,
          child:
              _i3.DeckBuilderScreenProvider(preBuiltDeck: route.preBuiltDeck),
          maintainState: true,
          fullscreenDialog: false);
    },
    YugiohCardDetailRoute.name: (entry) {
      var route = entry.routeData.as<YugiohCardDetailRoute>();
      return _i1.AdaptivePage(
          entry: entry,
          child: _i4.YugiohCardDetailScreenProvider(
              yugiohCard: route.yugiohCard, index: route.index),
          maintainState: true,
          fullscreenDialog: false);
    },
    DrawCardRoute.name: (entry) {
      var route = entry.routeData.as<DrawCardRoute>();
      return _i1.CustomPage(
          entry: entry,
          child: _i5.DrawCardScreenProvider(
              cardDrawnCallback: route.cardDrawnCallback),
          maintainState: true,
          fullscreenDialog: false,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
          opaque: true,
          barrierDismissible: false);
    },
    SpeedDuelRoute.name: (entry) {
      var route = entry.routeData.as<SpeedDuelRoute>();
      return _i1.AdaptivePage(
          entry: entry,
          child: _i6.SpeedDuelScreenProvider(preBuiltDeck: route.preBuiltDeck),
          maintainState: true,
          fullscreenDialog: false);
    },
    DuelTab.name: (entry) {
      return _i1.AdaptivePage(
          entry: entry,
          child: _i2.DuelScreenProvider(),
          maintainState: true,
          fullscreenDialog: false);
    },
    NewsTab.name: (entry) {
      return _i1.AdaptivePage(
          entry: entry,
          child: _i2.NewsScreenProvider(),
          maintainState: true,
          fullscreenDialog: false);
    },
    DeckTab.name: (entry) {
      return _i1.AdaptivePage(
          entry: entry,
          child: _i2.DeckScreenProvider(),
          maintainState: true,
          fullscreenDialog: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<HomeRoute>(HomeRoute.name,
            path: '/',
            fullMatch: false,
            usesTabsRouter: true,
            routeBuilder: (match) => HomeRoute.fromMatch(match),
            children: [
              _i1.RouteConfig<DuelTab>(DuelTab.name,
                  path: 'duel-screen-provider',
                  fullMatch: false,
                  usesTabsRouter: false,
                  routeBuilder: (match) => DuelTab.fromMatch(match)),
              _i1.RouteConfig<NewsTab>(NewsTab.name,
                  path: 'news-screen-provider',
                  fullMatch: false,
                  usesTabsRouter: false,
                  routeBuilder: (match) => NewsTab.fromMatch(match)),
              _i1.RouteConfig<DeckTab>(DeckTab.name,
                  path: 'deck-screen-provider',
                  fullMatch: false,
                  usesTabsRouter: false,
                  routeBuilder: (match) => DeckTab.fromMatch(match))
            ]),
        _i1.RouteConfig<DeckBuilderRoute>(DeckBuilderRoute.name,
            path: '/deck-builder-screen-provider',
            fullMatch: false,
            usesTabsRouter: false,
            routeBuilder: (match) => DeckBuilderRoute.fromMatch(match)),
        _i1.RouteConfig<YugiohCardDetailRoute>(YugiohCardDetailRoute.name,
            path: '/yugioh-card-detail-screen-provider',
            fullMatch: false,
            usesTabsRouter: false,
            routeBuilder: (match) => YugiohCardDetailRoute.fromMatch(match)),
        _i1.RouteConfig<DrawCardRoute>(DrawCardRoute.name,
            path: '/draw-card-screen-provider',
            fullMatch: false,
            usesTabsRouter: false,
            routeBuilder: (match) => DrawCardRoute.fromMatch(match)),
        _i1.RouteConfig<SpeedDuelRoute>(SpeedDuelRoute.name,
            path: '/speed-duel-screen-provider',
            fullMatch: false,
            usesTabsRouter: false,
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
  DeckBuilderRoute({this.preBuiltDeck})
      : super(name, path: '/deck-builder-screen-provider');

  DeckBuilderRoute.fromMatch(_i1.RouteMatch match)
      : preBuiltDeck = null,
        super.fromMatch(match);

  final _i7.PreBuiltDeck preBuiltDeck;

  static const String name = 'DeckBuilderRoute';
}

class YugiohCardDetailRoute extends _i1.PageRouteInfo {
  YugiohCardDetailRoute(
      {@_i8.required this.yugiohCard, @_i8.required this.index})
      : super(name, path: '/yugioh-card-detail-screen-provider');

  YugiohCardDetailRoute.fromMatch(_i1.RouteMatch match)
      : yugiohCard = null,
        index = null,
        super.fromMatch(match);

  final _i7.YugiohCard yugiohCard;

  final int index;

  static const String name = 'YugiohCardDetailRoute';
}

class DrawCardRoute extends _i1.PageRouteInfo {
  DrawCardRoute({@_i8.required this.cardDrawnCallback})
      : super(name, path: '/draw-card-screen-provider');

  DrawCardRoute.fromMatch(_i1.RouteMatch match)
      : cardDrawnCallback = null,
        super.fromMatch(match);

  final void Function() cardDrawnCallback;

  static const String name = 'DrawCardRoute';
}

class SpeedDuelRoute extends _i1.PageRouteInfo {
  SpeedDuelRoute({@_i8.required this.preBuiltDeck})
      : super(name, path: '/speed-duel-screen-provider');

  SpeedDuelRoute.fromMatch(_i1.RouteMatch match)
      : preBuiltDeck = null,
        super.fromMatch(match);

  final _i7.PreBuiltDeck preBuiltDeck;

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
