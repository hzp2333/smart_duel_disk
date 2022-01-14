import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'rows/zones/cards/player_card.dart';

class CardListBottomSheet extends StatelessWidget {
  static const _cardSpacing = 12.0;

  final PlayerState playerState;
  final Zone zone;

  const CardListBottomSheet({
    required this.playerState,
    required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    final bottomSheetHeight = context.screenHeight * 0.4;
    final cards = zone.cards.toList().reversed;

    return Provider.value(
      value: playerState,
      child: SizedBox(
        height: bottomSheetHeight,
        width: double.infinity,
        child: ScrollConfiguration(
          behavior: const NoScrollGlowBehavior(),
          child: Scrollbar(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(
                left: _cardSpacing,
                top: _cardSpacing,
                right: _cardSpacing,
              ),
              separatorBuilder: (_, __) => const SizedBox(width: _cardSpacing),
              itemBuilder: (_, index) => Align(
                alignment: Alignment.topCenter,
                child: PlayerCardBuilder(card: cards.elementAt(index)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
