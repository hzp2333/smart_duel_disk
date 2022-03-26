// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i14;
import 'package:smart_duel_disk/packages/core/core_navigation/lib/src/guards/auth_guard.dart'
    as _i13;
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i15;
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
import 'package:smart_duel_disk/packages/features/profile/src/widgets/profile_screen_provider.dart'
    as _i10;

class AutoRouteRouter extends _i11.RootStackRouter {
  AutoRouteRouter(
      {_i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i13.AuthGuard authGuard;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i11.AdaptivePage<void>(
          routeData: routeData, child: _i1.OnboardingScreenProvider());
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i11.AdaptivePage<void>(
          routeData: routeData,
          child: _i1.SignInScreenProvider(onSignedIn: args.onSignedIn));
    },
    HomeRoute.name: (routeData) {
      return _i11.AdaptivePage<void>(
          routeData: routeData, child: _i2.HomeScreenProvider());
    },
    DeckBuilderRoute.name: (routeData) {
      final args = routeData.argsAs<DeckBuilderRouteArgs>(
          orElse: () => const DeckBuilderRouteArgs());
      return _i11.AdaptivePage<void>(
          routeData: routeData,
          child: _i3.DeckBuilderScreenProvider(
              preBuiltDeck: args.preBuiltDeck, userDeck: args.userDeck));
    },
    YugiohCardDetailRoute.name: (routeData) {
      final args = routeData.argsAs<YugiohCardDetailRouteArgs>();
      return _i11.AdaptivePage<void>(
          routeData: routeData,
          child: _i4.YugiohCardDetailScreenProvider(
              cardCopy: args.cardCopy, tag: args.tag));
    },
    DrawCardRoute.name: (routeData) {
      final args = routeData.argsAs<DrawCardRouteArgs>();
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: _i5.DrawCardScreenProvider(
              cardDrawnCallback: args.cardDrawnCallback),
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
          opaque: true,
          barrierDismissible: false);
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i11.AdaptivePage<void>(
          routeData: routeData, child: _i6.PrivacyPolicyScreenProvider());
    },
    SpeedDuelRoute.name: (routeData) {
      final args = routeData.argsAs<SpeedDuelRouteArgs>();
      return _i11.AdaptivePage<void>(
          routeData: routeData,
          child: _i7.SpeedDuelScreenProvider(duelRoom: args.duelRoom));
    },
    DuelRoomRoute.name: (routeData) {
      return _i11.AdaptivePage<void>(
          routeData: routeData, child: _i8.DuelRoomScreenProvider());
    },
    UserSettingsRoute.name: (routeData) {
      return _i11.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.UserSettingsScreenProvider(),
          fullscreenDialog: true);
    },
    GameSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<GameSettingsRouteArgs>();
      return _i11.AdaptivePage<void>(
          routeData: routeData,
          child: _i9.GameSettingsScreenProvider(
              showBackButton: args.showBackButton,
              showCloseButton: args.showCloseButton));
    },
    ProfileRoute.name: (routeData) {
      return _i11.AdaptivePage<void>(
          routeData: routeData, child: _i10.ProfileScreenProvider());
    },
    DuelTab.name: (routeData) {
      return _i11.AdaptivePage<void>(
          routeData: routeData, child: _i2.DuelScreenProvider());
    },
    NewsTab.name: (routeData) {
      return _i11.AdaptivePage<void>(
          routeData: routeData, child: _i2.NewsScreenProvider());
    },
    DeckTab.name: (routeData) {
      return _i11.AdaptivePage<void>(
          routeData: routeData, child: _i2.DeckScreenProvider());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(OnboardingRoute.name, path: '/'),
        _i11.RouteConfig(SignInRoute.name, path: '/sign-in'),
        _i11.RouteConfig(HomeRoute.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i11.RouteConfig(DuelTab.name,
              path: 'duel', parent: HomeRoute.name, guards: [authGuard]),
          _i11.RouteConfig(NewsTab.name,
              path: 'news', parent: HomeRoute.name, guards: [authGuard]),
          _i11.RouteConfig(DeckTab.name,
              path: 'deck', parent: HomeRoute.name, guards: [authGuard])
        ]),
        _i11.RouteConfig(DeckBuilderRoute.name,
            path: '/deck-builder', guards: [authGuard]),
        _i11.RouteConfig(YugiohCardDetailRoute.name,
            path: '/card-detail', guards: [authGuard]),
        _i11.RouteConfig(DrawCardRoute.name,
            path: '/draw-card-screen-provider'),
        _i11.RouteConfig(PrivacyPolicyRoute.name,
            path: '/privacy-policy', guards: [authGuard]),
        _i11.RouteConfig(SpeedDuelRoute.name,
            path: '/speed-duel', guards: [authGuard]),
        _i11.RouteConfig(DuelRoomRoute.name,
            path: '/duel-room', guards: [authGuard]),
        _i11.RouteConfig(UserSettingsRoute.name,
            path: '/user-settings', guards: [authGuard]),
        _i11.RouteConfig(GameSettingsRoute.name,
            path: '/user-settings/game-settings', guards: [authGuard]),
        _i11.RouteConfig(ProfileRoute.name,
            path: '/user-settings/profile', guards: [authGuard])
      ];
}

/// generated route for
/// [_i1.OnboardingScreenProvider]
class OnboardingRoute extends _i11.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i1.SignInScreenProvider]
class SignInRoute extends _i11.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({void Function(bool)? onSignedIn})
      : super(SignInRoute.name,
            path: '/sign-in', args: SignInRouteArgs(onSignedIn: onSignedIn));

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.onSignedIn});

  final void Function(bool)? onSignedIn;

  @override
  String toString() {
    return 'SignInRouteArgs{onSignedIn: $onSignedIn}';
  }
}

/// generated route for
/// [_i2.HomeScreenProvider]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.DeckBuilderScreenProvider]
class DeckBuilderRoute extends _i11.PageRouteInfo<DeckBuilderRouteArgs> {
  DeckBuilderRoute({_i14.PreBuiltDeck? preBuiltDeck, _i14.UserDeck? userDeck})
      : super(DeckBuilderRoute.name,
            path: '/deck-builder',
            args: DeckBuilderRouteArgs(
                preBuiltDeck: preBuiltDeck, userDeck: userDeck));

  static const String name = 'DeckBuilderRoute';
}

class DeckBuilderRouteArgs {
  const DeckBuilderRouteArgs({this.preBuiltDeck, this.userDeck});

  final _i14.PreBuiltDeck? preBuiltDeck;

  final _i14.UserDeck? userDeck;

  @override
  String toString() {
    return 'DeckBuilderRouteArgs{preBuiltDeck: $preBuiltDeck, userDeck: $userDeck}';
  }
}

/// generated route for
/// [_i4.YugiohCardDetailScreenProvider]
class YugiohCardDetailRoute
    extends _i11.PageRouteInfo<YugiohCardDetailRouteArgs> {
  YugiohCardDetailRoute({required _i14.CardCopy cardCopy, required String tag})
      : super(YugiohCardDetailRoute.name,
            path: '/card-detail',
            args: YugiohCardDetailRouteArgs(cardCopy: cardCopy, tag: tag));

  static const String name = 'YugiohCardDetailRoute';
}

class YugiohCardDetailRouteArgs {
  const YugiohCardDetailRouteArgs({required this.cardCopy, required this.tag});

  final _i14.CardCopy cardCopy;

  final String tag;

  @override
  String toString() {
    return 'YugiohCardDetailRouteArgs{cardCopy: $cardCopy, tag: $tag}';
  }
}

/// generated route for
/// [_i5.DrawCardScreenProvider]
class DrawCardRoute extends _i11.PageRouteInfo<DrawCardRouteArgs> {
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
class PrivacyPolicyRoute extends _i11.PageRouteInfo<void> {
  const PrivacyPolicyRoute()
      : super(PrivacyPolicyRoute.name, path: '/privacy-policy');

  static const String name = 'PrivacyPolicyRoute';
}

/// generated route for
/// [_i7.SpeedDuelScreenProvider]
class SpeedDuelRoute extends _i11.PageRouteInfo<SpeedDuelRouteArgs> {
  SpeedDuelRoute({required _i15.DuelRoom duelRoom})
      : super(SpeedDuelRoute.name,
            path: '/speed-duel', args: SpeedDuelRouteArgs(duelRoom: duelRoom));

  static const String name = 'SpeedDuelRoute';
}

class SpeedDuelRouteArgs {
  const SpeedDuelRouteArgs({required this.duelRoom});

  final _i15.DuelRoom duelRoom;

  @override
  String toString() {
    return 'SpeedDuelRouteArgs{duelRoom: $duelRoom}';
  }
}

/// generated route for
/// [_i8.DuelRoomScreenProvider]
class DuelRoomRoute extends _i11.PageRouteInfo<void> {
  const DuelRoomRoute() : super(DuelRoomRoute.name, path: '/duel-room');

  static const String name = 'DuelRoomRoute';
}

/// generated route for
/// [_i9.UserSettingsScreenProvider]
class UserSettingsRoute extends _i11.PageRouteInfo<void> {
  const UserSettingsRoute()
      : super(UserSettingsRoute.name, path: '/user-settings');

  static const String name = 'UserSettingsRoute';
}

/// generated route for
/// [_i9.GameSettingsScreenProvider]
class GameSettingsRoute extends _i11.PageRouteInfo<GameSettingsRouteArgs> {
  GameSettingsRoute(
      {required bool showBackButton, required bool showCloseButton})
      : super(GameSettingsRoute.name,
            path: '/user-settings/game-settings',
            args: GameSettingsRouteArgs(
                showBackButton: showBackButton,
                showCloseButton: showCloseButton));

  static const String name = 'GameSettingsRoute';
}

class GameSettingsRouteArgs {
  const GameSettingsRouteArgs(
      {required this.showBackButton, required this.showCloseButton});

  final bool showBackButton;

  final bool showCloseButton;

  @override
  String toString() {
    return 'GameSettingsRouteArgs{showBackButton: $showBackButton, showCloseButton: $showCloseButton}';
  }
}

/// generated route for
/// [_i10.ProfileScreenProvider]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute()
      : super(ProfileRoute.name, path: '/user-settings/profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i2.DuelScreenProvider]
class DuelTab extends _i11.PageRouteInfo<void> {
  const DuelTab() : super(DuelTab.name, path: 'duel');

  static const String name = 'DuelTab';
}

/// generated route for
/// [_i2.NewsScreenProvider]
class NewsTab extends _i11.PageRouteInfo<void> {
  const NewsTab() : super(NewsTab.name, path: 'news');

  static const String name = 'NewsTab';
}

/// generated route for
/// [_i2.DeckScreenProvider]
class DeckTab extends _i11.PageRouteInfo<void> {
  const DeckTab() : super(DeckTab.name, path: 'deck');

  static const String name = 'DeckTab';
}
