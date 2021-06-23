import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

import 'rows/zones/cards/player_card.dart';

class CardListBottomSheet extends StatelessWidget {
  final PlayerState playerState;
  final Zone zone;

  const CardListBottomSheet({
    @required this.playerState,
    @required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    final bottomSheetHeight = MediaQuery.of(context).size.height * 0.35;
    final cards = zone.cards.toList().reversed;

    return Provider.value(
      value: playerState,
      child: SizedBox(
        height: bottomSheetHeight,
        width: double.infinity,
        child: Center(
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
            itemCount: cards.length,
            itemBuilder: (_, index) => PlayerCardBuilder(card: cards.elementAt(index)),
            separatorBuilder: (_, __) => const SizedBox(width: 12),
          ),
        ),
      ),
    );
  }
}
