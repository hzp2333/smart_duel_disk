import 'package:auto_route/annotations.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/feature_deck_builder.dart';
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/feature_draw_card.dart';
import 'package:smart_duel_disk/packages/features/feature_duel_room/lib/src/widgets/duel_room_screen_provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart';
import 'package:smart_duel_disk/packages/features/feature_onboarding/lib/feature_onboarding.dart';
import 'package:smart_duel_disk/packages/features/feature_privacy_policy/lib/feature_privacy_policy.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/feature_speed_duel.dart';
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/src/widgets/user_settings_screen_provider.dart';
import 'package:smart_duel_disk/packages/features/feature_yugioh_card_detail/lib/feature_yugioh_card_detail.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'ScreenProvider,Route',
  routes: <AutoRoute>[
    AutoRoute<void>(page: OnboardingScreenProvider, initial: true),
    AutoRoute<void>(
      page: HomeScreenProvider,
      path: '/home',
      children: [
        AutoRoute<void>(name: 'DuelTab', page: DuelScreenProvider, path: 'duel'),
        AutoRoute<void>(name: 'NewsTab', page: NewsScreenProvider, path: 'news'),
        AutoRoute<void>(name: 'DeckTab', page: DeckScreenProvider, path: 'deck'),
      ],
    ),
    AutoRoute<void>(page: DeckBuilderScreenProvider, path: '/deck-builder'),
    AutoRoute<void>(page: YugiohCardDetailScreenProvider, path: '/card-detail'),
    CustomRoute<void>(
      page: DrawCardScreenProvider,
      durationInMilliseconds: 0,
      reverseDurationInMilliseconds: 0,
    ),
    AutoRoute<void>(page: PrivacyPolicyScreenProvider, path: '/privacy-policy'),
    AutoRoute<void>(page: SpeedDuelScreenProvider, path: '/speed-duel'),
    AutoRoute<void>(page: DuelRoomScreenProvider, path: '/duel-room'),
    AutoRoute<void>(page: UserSettingsScreenProvider, path: '/user-settings', fullscreenDialog: true)
  ],
)
class $AutoRouteRouter {}
