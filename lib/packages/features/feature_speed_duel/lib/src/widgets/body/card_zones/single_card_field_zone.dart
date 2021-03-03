import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

import '../draggable_card.dart';
import 'shared.dart';

class SingleCardFieldZone extends StatelessWidget {
  final Zone zone;

  const SingleCardFieldZone({
    @required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    return CardDragTarget(
      zone: zone,
      child: zone.cards.isEmpty
          ? const EmptyZone()
          : DraggableCard(
              card: zone.cards.first,
              zone: zone,
            ),
    );
  }
}
