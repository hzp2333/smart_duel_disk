import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../draggable_card.dart';
import 'shared.dart';

class HandZone extends StatelessWidget {
  final Zone zone;

  const HandZone({
    @required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    return CardDragTarget(
      zone: zone,
      child: SizedBox.expand(
        child: Center(
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: zone.cards.length,
            itemBuilder: (_, index) => DraggableCard(
              card: zone.cards.elementAt(index),
              zone: zone,
            ),
            separatorBuilder: (_, __) => const SizedBox(
              width: AppDimensions.screenMargin,
            ),
          ),
        ),
      ),
    );
  }
}
