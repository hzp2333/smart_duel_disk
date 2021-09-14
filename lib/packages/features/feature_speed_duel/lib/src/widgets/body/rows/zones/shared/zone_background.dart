import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class ZoneBackground extends StatelessWidget {
  final ZoneType zoneType;
  final Widget? card;

  const ZoneBackground({
    required this.zoneType,
    this.card,
  });

  @override
  Widget build(BuildContext context) {
    final cardHeight = context.playCardHeight;
    final cardWidth = context.playCardHeight * AppSizes.yugiohCardAspectRatio;
    final zoneWidth = zoneType.isMainMonsterZone || zoneType.isSpellTrapCardZone ? cardHeight : null;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: cardHeight,
          width: zoneWidth,
        ),
        if (zoneType.isMainMonsterZone) ...{
          Container(
            width: cardHeight,
            height: cardWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70),
            ),
          ),
        },
        AspectRatio(
          aspectRatio: AppSizes.yugiohCardAspectRatio,
          child: Container(
            height: cardHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
          ),
        ),
        if (card != null) ...{
          card!,
        },
      ],
    );
  }
}
