import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

import 'rows/zones/cards/draggable_card.dart';

class CardListBottomSheet extends StatelessWidget {
  final Zone zone;

  const CardListBottomSheet({
    @required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    final bottomSheetHeight = MediaQuery.of(context).size.height * 0.35;
    final cards = zone.cards.toList().reversed;

    return SizedBox(
      height: bottomSheetHeight,
      width: double.infinity,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
          itemCount: cards.length,
          itemBuilder: (context, index) => DraggableCard(
            card: cards.elementAt(index),
            zone: zone,
          ),
          separatorBuilder: (_, __) => const SizedBox(width: 12),
        ),
      ),
    );
  }
}
