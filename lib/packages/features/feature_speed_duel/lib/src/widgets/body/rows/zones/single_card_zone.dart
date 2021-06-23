import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

import 'cards/player_card.dart';
import 'shared/card_drag_target.dart';
import 'shared/zone_background.dart';

class SingleCardZone extends StatelessWidget {
  final Zone zone;

  const SingleCardZone({
    @required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    return CardDragTarget(
      zone: zone,
      child: ZoneBackground(
        zoneType: zone.zoneType,
        card: zone.cards.isEmpty ? null : PlayerCardBuilder(card: zone.cards.first),
      ),
    );
  }
}
