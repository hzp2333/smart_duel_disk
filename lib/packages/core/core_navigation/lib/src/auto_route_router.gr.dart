// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i12;
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i13;
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/feature_deck_builder.dart'
    as _i5;
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/feature_draw_card.dart'
    as _i7;
import 'package:smart_duel_disk/packages/features/feature_duel_room/lib/src/widgets/duel_room_screen_provider.dart'
    as _i10;
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart'
    as _i4;
import 'package:smart_duel_disk/packages/features/feature_onboarding/lib/feature_onboarding.dart'
    as _i3;
import 'package:smart_duel_disk/packages/features/feature_privacy_policy/lib/feature_privacy_policy.dart'
    as _i8;
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i9;
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/src/widgets/user_settings_screen_provider.dart'
    as _i11;
import 'package:smart_duel_disk/packages/features/feature_yugioh_card_detail/lib/feature_yugioh_card_detail.dart'
    as _i6;

class AutoRouteRouter extends _i1.RootStackRouter {
  AutoRouteRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i1.AdaptivePage<void>(
          routeData: routeData, child: _i3.OnboardingScreenProvider());
    },
    HomeRoute.name: (routeData) {
      return _i1.AdaptivePage<void>(
          routeData: routeData, child: _i4.HomeScreenProvider());
    },
    DeckBuilderRoute.name: (routeData) {
      final args = routeData.argsAs<DeckBuilderRouteArgs>(
          orElse: () => const DeckBuilderRouteArgs());
      return _i1.AdaptivePage<void>(
          routeData: routeData,
          child:
              _i5.DeckBuilderScreenProvider(preBuiltDeck: args.preBuiltDeck));
    },
    YugiohCardDetailRoute.name: (routeData) {
      final args = routeData.argsAs<YugiohCardDetailRouteArgs>();
      return _i1.AdaptivePage<void>(
          routeData: routeData,
          child: _i6.YugiohCardDetailScreenProvider(
              yugiohCard: args.yugiohCard, index: args.index));
    },
    DrawCardRoute.name: (routeData) {
      final args = routeData.argsAs<DrawCardRouteArgs>();
      return _i1.CustomPage<void>(
          routeData: routeData,
          child: _i7.DrawCardScreenProvider(
              cardDrawnCallback: args.cardDrawnCallback),
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
          opaque: true,
          barrierDismissible: false);
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i1.AdaptivePage<void>(
          routeData: routeData, child: _i8.PrivacyPolicyScreenProvider());
    },
    SpeedDuelRoute.name: (routeData) {
      final args = routeData.argsAs<SpeedDuelRouteArgs>();
      return _i1.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.SpeedDuelScreenProvider(duelRoom: args.duelRoom));
    },
    DuelRoomRoute.name: (routeData) {
      final args = routeData.argsAs<DuelRoomRouteArgs>();
      return _i1.AdaptivePage<void>(
          routeData: routeData,
          child: _i10.DuelRoomScreenProvider(preBuiltDeck: args.preBuiltDeck));
    },
    UserSettingsRoute.name: (routeData) {
      return _i1.AdaptivePage<void>(
          routeData: routeData,
          child: _i11.UserSettingsScreenProvider(),
          fullscreenDialog: true);
    },
    DuelTab.name: (routeData) {
      return _i1.AdaptivePage<void>(
          routeData: routeData, child: _i4.DuelScreenProvider());
    },
    NewsTab.name: (routeData) {
      return _i1.AdaptivePage<void>(
          routeData: routeData, child: _i4.NewsScreenProvider());
    },
    DeckTab.name: (routeData) {
      return _i1.AdaptivePage<void>(
          routeData: routeData, child: _i4.DeckScreenProvider());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(OnboardingRoute.name, path: '/'),
        _i1.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i1.RouteConfig(DuelTab.name, path: 'duel'),
          _i1.RouteConfig(NewsTab.name, path: 'news'),
          _i1.RouteConfig(DeckTab.name, path: 'deck')
        ]),
        _i1.RouteConfig(DeckBuilderRoute.name, path: '/deck-builder'),
        _i1.RouteConfig(YugiohCardDetailRoute.name, path: '/card-detail'),
        _i1.RouteConfig(DrawCardRoute.name, path: '/draw-card-screen-provider'),
        _i1.RouteConfig(PrivacyPolicyRoute.name, path: '/privacy-policy'),
        _i1.RouteConfig(SpeedDuelRoute.name, path: '/speed-duel'),
        _i1.RouteConfig(DuelRoomRoute.name, path: '/duel-room'),
        _i1.RouteConfig(UserSettingsRoute.name, path: '/user-settings')
      ];
}

class OnboardingRoute extends _i1.PageRouteInfo<void> {
  const OnboardingRoute() : super(name, path: '/');

  static const String name = 'OnboardingRoute';
}

class HomeRoute extends _i1.PageRouteInfo<void> {
  const HomeRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

class DeckBuilderRoute extends _i1.PageRouteInfo<DeckBuilderRouteArgs> {
  DeckBuilderRoute({_i12.PreBuiltDeck? preBuiltDeck})
      : super(name,
            path: '/deck-builder',
            args: DeckBuilderRouteArgs(preBuiltDeck: preBuiltDeck));

  static const String name = 'DeckBuilderRoute';
}

class DeckBuilderRouteArgs {
  const DeckBuilderRouteArgs({this.preBuiltDeck});

  final _i12.PreBuiltDeck? preBuiltDeck;
}

class YugiohCardDetailRoute
    extends _i1.PageRouteInfo<YugiohCardDetailRouteArgs> {
  YugiohCardDetailRoute(
      {required _i12.YugiohCard yugiohCard, required int index})
      : super(name,
            path: '/card-detail',
            args: YugiohCardDetailRouteArgs(
                yugiohCard: yugiohCard, index: index));

  static const String name = 'YugiohCardDetailRoute';
}

class YugiohCardDetailRouteArgs {
  const YugiohCardDetailRouteArgs(
      {required this.yugiohCard, required this.index});

  final _i12.YugiohCard yugiohCard;

  final int index;
}

class DrawCardRoute extends _i1.PageRouteInfo<DrawCardRouteArgs> {
  DrawCardRoute({required void Function() cardDrawnCallback})
      : super(name,
            path: '/draw-card-screen-provider',
            args: DrawCardRouteArgs(cardDrawnCallback: cardDrawnCallback));

  static const String name = 'DrawCardRoute';
}

class DrawCardRouteArgs {
  const DrawCardRouteArgs({required this.cardDrawnCallback});

  final void Function() cardDrawnCallback;
}

class PrivacyPolicyRoute extends _i1.PageRouteInfo<void> {
  const PrivacyPolicyRoute() : super(name, path: '/privacy-policy');

  static const String name = 'PrivacyPolicyRoute';
}

class SpeedDuelRoute extends _i1.PageRouteInfo<SpeedDuelRouteArgs> {
  SpeedDuelRoute({required _i13.DuelRoom duelRoom})
      : super(name,
            path: '/speed-duel', args: SpeedDuelRouteArgs(duelRoom: duelRoom));

  static const String name = 'SpeedDuelRoute';
}

class SpeedDuelRouteArgs {
  const SpeedDuelRouteArgs({required this.duelRoom});

  final _i13.DuelRoom duelRoom;
}

class DuelRoomRoute extends _i1.PageRouteInfo<DuelRoomRouteArgs> {
  DuelRoomRoute({required _i12.PreBuiltDeck preBuiltDeck})
      : super(name,
            path: '/duel-room',
            args: DuelRoomRouteArgs(preBuiltDeck: preBuiltDeck));

  static const String name = 'DuelRoomRoute';
}

class DuelRoomRouteArgs {
  const DuelRoomRouteArgs({required this.preBuiltDeck});

  final _i12.PreBuiltDeck preBuiltDeck;
}

class UserSettingsRoute extends _i1.PageRouteInfo<void> {
  const UserSettingsRoute() : super(name, path: '/user-settings');

  static const String name = 'UserSettingsRoute';
}

class DuelTab extends _i1.PageRouteInfo<void> {
  const DuelTab() : super(name, path: 'duel');

  static const String name = 'DuelTab';
}

class NewsTab extends _i1.PageRouteInfo<void> {
  const NewsTab() : super(name, path: 'news');

  static const String name = 'NewsTab';
}

class DeckTab extends _i1.PageRouteInfo<void> {
  const DeckTab() : super(name, path: 'deck');

  static const String name = 'DeckTab';
}
