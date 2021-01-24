import 'package:auto_route/annotations.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/feature_deck_builder.dart';
import 'package:smart_duel_disk/packages/features/feature_draw_card/lib/feature_draw_card.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/feature_speed_duel.dart';
import 'package:smart_duel_disk/packages/features/feature_yugioh_card_detail/lib/feature_yugioh_card_detail.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'ScreenProvider,Route',
  routes: <AutoRoute>[
    AutoRoute<void>(
      page: HomeScreenProvider,
      initial: true,
      usesTabsRouter: true,
      children: [
        AutoRoute<void>(name: 'DuelTab', page: DuelScreenProvider),
        AutoRoute<void>(name: 'NewsTab', page: NewsScreenProvider),
        AutoRoute<void>(name: 'DeckTab', page: DeckScreenProvider),
      ],
    ),
    AutoRoute<void>(page: DeckBuilderScreenProvider),
    AutoRoute<void>(page: YugiohCardDetailScreenProvider),
    AutoRoute<void>(page: DrawCardScreenProvider),
    AutoRoute<void>(page: SpeedDuelScreenProvider),
  ],
)
class $AppRouter {}
