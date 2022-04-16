import 'package:auto_route/annotations.dart';
import 'package:smart_duel_disk/packages/features/deck/deck.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/feature_deck_builder.dart';
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/feature_draw_card.dart';
import 'package:smart_duel_disk/packages/features/feature_duel_room/lib/feature_duel_room.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart';
import 'package:smart_duel_disk/packages/features/feature_onboarding/lib/feature_onboarding.dart';
import 'package:smart_duel_disk/packages/features/feature_privacy_policy/lib/feature_privacy_policy.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/feature_speed_duel.dart';
import 'package:smart_duel_disk/packages/features/feature_user_settings/lib/feature_user_settings.dart';
import 'package:smart_duel_disk/packages/features/feature_yugioh_card_detail/lib/feature_yugioh_card_detail.dart';
import 'package:smart_duel_disk/packages/features/profile/src/widgets/profile_screen_provider.dart';

import 'routes/smart_duel_disk_route.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'ScreenProvider,Route',
  routes: <AutoRoute>[
    AutoRoute<void>(page: OnboardingScreenProvider, initial: true),
    AutoRoute<void>(page: SignInScreenProvider, path: '/sign-in'),
    SmartDuelDiskRoute<void>(
      page: HomeScreenProvider,
      path: '/home',
      children: [
        SmartDuelDiskRoute<void>(name: 'DuelTab', page: DuelScreenProvider, path: 'duel'),
        SmartDuelDiskRoute<void>(name: 'NewsTab', page: NewsScreenProvider, path: 'news'),
        SmartDuelDiskRoute<void>(name: 'DeckTab', page: DeckScreenProvider, path: 'deck'),
      ],
    ),
    SmartDuelDiskRoute<void>(page: DeckScreenProvider, path: '/decks'),
    SmartDuelDiskRoute<void>(page: DeckBuilderScreenProvider, path: '/deck-builder'),
    SmartDuelDiskRoute<void>(page: YugiohCardDetailScreenProvider, path: '/card-detail'),
    CustomRoute<void>(
      page: DrawCardScreenProvider,
      durationInMilliseconds: 0,
      reverseDurationInMilliseconds: 0,
    ),
    SmartDuelDiskRoute<void>(page: PrivacyPolicyScreenProvider, path: '/privacy-policy'),
    SmartDuelDiskRoute<void>(page: SpeedDuelScreenProvider, path: '/speed-duel'),
    SmartDuelDiskRoute<void>(page: DuelRoomScreenProvider, path: '/duel-room'),
    SmartDuelDiskRoute<void>(page: UserSettingsScreenProvider, path: '/user-settings', fullscreenDialog: true),
    SmartDuelDiskRoute<void>(page: GameSettingsScreenProvider, path: '/user-settings/game-settings'),
    SmartDuelDiskRoute<void>(page: ProfileScreenProvider, path: '/user-settings/profile'),
  ],
)
class $AutoRouteRouter {}
