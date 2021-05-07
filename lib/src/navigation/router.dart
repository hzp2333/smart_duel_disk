import 'package:auto_route/annotations.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/feature_deck_builder.dart';
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/feature_draw_card.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart';
import 'package:smart_duel_disk/packages/features/feature_onboarding/lib/feature_onboarding.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/feature_speed_duel.dart';
import 'package:smart_duel_disk/packages/features/feature_yugioh_card_detail/lib/feature_yugioh_card_detail.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'ScreenProvider,Route',
  routes: <AutoRoute>[
    AutoRoute<void>(
      page: OnboardingScreenProvider,
      initial: true,
    ),
    AutoRoute<void>(
      page: HomeScreenProvider,
      usesTabsRouter: true,
      children: [
        AutoRoute<void>(name: 'DuelTab', page: DuelScreenProvider),
        AutoRoute<void>(name: 'NewsTab', page: NewsScreenProvider),
        AutoRoute<void>(name: 'DeckTab', page: DeckScreenProvider),
      ],
    ),
    AutoRoute<void>(page: DeckBuilderScreenProvider),
    AutoRoute<void>(page: YugiohCardDetailScreenProvider),
    CustomRoute<void>(
      page: DrawCardScreenProvider,
      durationInMilliseconds: 0,
      reverseDurationInMilliseconds: 0,
    ),
    AutoRoute<void>(page: SpeedDuelScreenProvider),
  ],
)
class $AppRouter {}
