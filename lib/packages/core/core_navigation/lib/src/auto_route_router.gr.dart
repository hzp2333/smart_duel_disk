// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i12;
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i13;
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/feature_deck_builder.dart'
    as _i3;
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/feature_draw_card.dart'
    as _i5;
import 'package:smart_duel_disk/packages/features/feature_duel_room/lib/feature_duel_room.dart'
    as _i8;
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart'
    as _i2;
import 'package:smart_duel_disk/packages/features/feature_onboarding/lib/feature_onboarding.dart'
    as _i1;
import 'package:smart_duel_disk/packages/features/feature_privacy_policy/lib/feature_privacy_policy.dart'
    as _i6;
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/feature_speed_duel.dart'
    as _i7;
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/feature_user_settings.dart'
    as _i9;
import 'package:smart_duel_disk/packages/features/feature_yugioh_card_detail/lib/feature_yugioh_card_detail.dart'
    as _i4;

class AutoRouteRouter extends _i10.RootStackRouter {
  AutoRouteRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i10.AdaptivePage<void>(
          routeData: routeData, child: _i1.OnboardingScreenProvider());
    },
    SignInRoute.name: (routeData) {
      return _i10.AdaptivePage<void>(
          routeData: routeData, child: _i1.SignInScreenProvider());
    },
    HomeRoute.name: (routeData) {
      return _i10.AdaptivePage<void>(
          routeData: routeData, child: _i2.HomeScreenProvider());
    },
    DeckBuilderRoute.name: (routeData) {
      final args = routeData.argsAs<DeckBuilderRouteArgs>(
          orElse: () => const DeckBuilderRouteArgs());
      return _i10.AdaptivePage<void>(
          routeData: routeData,
          child:
              _i3.DeckBuilderScreenProvider(preBuiltDeck: args.preBuiltDeck));
    },
    YugiohCardDetailRoute.name: (routeData) {
      final args = routeData.argsAs<YugiohCardDetailRouteArgs>();
      return _i10.AdaptivePage<void>(
          routeData: routeData,
          child: _i4.YugiohCardDetailScreenProvider(
              cardCopy: args.cardCopy, tag: args.tag));
    },
    DrawCardRoute.name: (routeData) {
      final args = routeData.argsAs<DrawCardRouteArgs>();
      return _i10.CustomPage<void>(
          routeData: routeData,
          child: _i5.DrawCardScreenProvider(
              cardDrawnCallback: args.cardDrawnCallback),
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
          opaque: true,
          barrierDismissible: false);
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i10.AdaptivePage<void>(
          routeData: routeData, child: _i6.PrivacyPolicyScreenProvider());
    },
    SpeedDuelRoute.name: (routeData) {
      final args = routeData.argsAs<SpeedDuelRouteArgs>();
      return _i10.AdaptivePage<void>(
          routeData: routeData,
          child: _i7.SpeedDuelScreenProvider(duelRoom: args.duelRoom));
    },
    DuelRoomRoute.name: (routeData) {
      final args = routeData.argsAs<DuelRoomRouteArgs>();
      return _i10.AdaptivePage<void>(
          routeData: routeData,
          child: _i8.DuelRoomScreenProvider(preBuiltDeck: args.preBuiltDeck));
    },
    UserSettingsRoute.name: (routeData) {
      return _i10.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.UserSettingsScreenProvider(),
          fullscreenDialog: true);
    },
    DuelTab.name: (routeData) {
      return _i10.AdaptivePage<void>(
          routeData: routeData, child: _i2.DuelScreenProvider());
    },
    NewsTab.name: (routeData) {
      return _i10.AdaptivePage<void>(
          routeData: routeData, child: _i2.NewsScreenProvider());
    },
    DeckTab.name: (routeData) {
      return _i10.AdaptivePage<void>(
          routeData: routeData, child: _i2.DeckScreenProvider());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(OnboardingRoute.name, path: '/'),
        _i10.RouteConfig(SignInRoute.name, path: '/sign-in'),
        _i10.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i10.RouteConfig(DuelTab.name, path: 'duel', parent: HomeRoute.name),
          _i10.RouteConfig(NewsTab.name, path: 'news', parent: HomeRoute.name),
          _i10.RouteConfig(DeckTab.name, path: 'deck', parent: HomeRoute.name)
        ]),
        _i10.RouteConfig(DeckBuilderRoute.name, path: '/deck-builder'),
        _i10.RouteConfig(YugiohCardDetailRoute.name, path: '/card-detail'),
        _i10.RouteConfig(DrawCardRoute.name,
            path: '/draw-card-screen-provider'),
        _i10.RouteConfig(PrivacyPolicyRoute.name, path: '/privacy-policy'),
        _i10.RouteConfig(SpeedDuelRoute.name, path: '/speed-duel'),
        _i10.RouteConfig(DuelRoomRoute.name, path: '/duel-room'),
        _i10.RouteConfig(UserSettingsRoute.name, path: '/user-settings')
      ];
}

/// generated route for
/// [_i1.OnboardingScreenProvider]
class OnboardingRoute extends _i10.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i1.SignInScreenProvider]
class SignInRoute extends _i10.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i2.HomeScreenProvider]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.DeckBuilderScreenProvider]
class DeckBuilderRoute extends _i10.PageRouteInfo<DeckBuilderRouteArgs> {
  DeckBuilderRoute({_i12.PreBuiltDeck? preBuiltDeck})
      : super(DeckBuilderRoute.name,
            path: '/deck-builder',
            args: DeckBuilderRouteArgs(preBuiltDeck: preBuiltDeck));

  static const String name = 'DeckBuilderRoute';
}

class DeckBuilderRouteArgs {
  const DeckBuilderRouteArgs({this.preBuiltDeck});

  final _i12.PreBuiltDeck? preBuiltDeck;

  @override
  String toString() {
    return 'DeckBuilderRouteArgs{preBuiltDeck: $preBuiltDeck}';
  }
}

/// generated route for
/// [_i4.YugiohCardDetailScreenProvider]
class YugiohCardDetailRoute
    extends _i10.PageRouteInfo<YugiohCardDetailRouteArgs> {
  YugiohCardDetailRoute({required _i12.CardCopy cardCopy, required String tag})
      : super(YugiohCardDetailRoute.name,
            path: '/card-detail',
            args: YugiohCardDetailRouteArgs(cardCopy: cardCopy, tag: tag));

  static const String name = 'YugiohCardDetailRoute';
}

class YugiohCardDetailRouteArgs {
  const YugiohCardDetailRouteArgs({required this.cardCopy, required this.tag});

  final _i12.CardCopy cardCopy;

  final String tag;

  @override
  String toString() {
    return 'YugiohCardDetailRouteArgs{cardCopy: $cardCopy, tag: $tag}';
  }
}

/// generated route for
/// [_i5.DrawCardScreenProvider]
class DrawCardRoute extends _i10.PageRouteInfo<DrawCardRouteArgs> {
  DrawCardRoute({required void Function() cardDrawnCallback})
      : super(DrawCardRoute.name,
            path: '/draw-card-screen-provider',
            args: DrawCardRouteArgs(cardDrawnCallback: cardDrawnCallback));

  static const String name = 'DrawCardRoute';
}

class DrawCardRouteArgs {
  const DrawCardRouteArgs({required this.cardDrawnCallback});

  final void Function() cardDrawnCallback;

  @override
  String toString() {
    return 'DrawCardRouteArgs{cardDrawnCallback: $cardDrawnCallback}';
  }
}

/// generated route for
/// [_i6.PrivacyPolicyScreenProvider]
class PrivacyPolicyRoute extends _i10.PageRouteInfo<void> {
  const PrivacyPolicyRoute()
      : super(PrivacyPolicyRoute.name, path: '/privacy-policy');

  static const String name = 'PrivacyPolicyRoute';
}

/// generated route for
/// [_i7.SpeedDuelScreenProvider]
class SpeedDuelRoute extends _i10.PageRouteInfo<SpeedDuelRouteArgs> {
  SpeedDuelRoute({required _i13.DuelRoom duelRoom})
      : super(SpeedDuelRoute.name,
            path: '/speed-duel', args: SpeedDuelRouteArgs(duelRoom: duelRoom));

  static const String name = 'SpeedDuelRoute';
}

class SpeedDuelRouteArgs {
  const SpeedDuelRouteArgs({required this.duelRoom});

  final _i13.DuelRoom duelRoom;

  @override
  String toString() {
    return 'SpeedDuelRouteArgs{duelRoom: $duelRoom}';
  }
}

/// generated route for
/// [_i8.DuelRoomScreenProvider]
class DuelRoomRoute extends _i10.PageRouteInfo<DuelRoomRouteArgs> {
  DuelRoomRoute({required _i12.PreBuiltDeck preBuiltDeck})
      : super(DuelRoomRoute.name,
            path: '/duel-room',
            args: DuelRoomRouteArgs(preBuiltDeck: preBuiltDeck));

  static const String name = 'DuelRoomRoute';
}

class DuelRoomRouteArgs {
  const DuelRoomRouteArgs({required this.preBuiltDeck});

  final _i12.PreBuiltDeck preBuiltDeck;

  @override
  String toString() {
    return 'DuelRoomRouteArgs{preBuiltDeck: $preBuiltDeck}';
  }
}

/// generated route for
/// [_i9.UserSettingsScreenProvider]
class UserSettingsRoute extends _i10.PageRouteInfo<void> {
  const UserSettingsRoute()
      : super(UserSettingsRoute.name, path: '/user-settings');

  static const String name = 'UserSettingsRoute';
}

/// generated route for
/// [_i2.DuelScreenProvider]
class DuelTab extends _i10.PageRouteInfo<void> {
  const DuelTab() : super(DuelTab.name, path: 'duel');

  static const String name = 'DuelTab';
}

/// generated route for
/// [_i2.NewsScreenProvider]
class NewsTab extends _i10.PageRouteInfo<void> {
  const NewsTab() : super(NewsTab.name, path: 'news');

  static const String name = 'NewsTab';
}

/// generated route for
/// [_i2.DeckScreenProvider]
class DeckTab extends _i10.PageRouteInfo<void> {
  const DeckTab() : super(DeckTab.name, path: 'deck');

  static const String name = 'DeckTab';
}
