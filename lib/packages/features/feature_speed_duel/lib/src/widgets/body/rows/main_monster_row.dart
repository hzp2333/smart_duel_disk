import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'zones/multi_card_zone.dart';
import 'zones/shared/zone_filler.dart';
import 'zones/single_card_zone.dart';

class MainMonsterRow extends StatelessWidget {
  const MainMonsterRow();

  @override
  Widget build(BuildContext context) {
    final playerState = Provider.of<PlayerState>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ZoneFiller(),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            SingleCardZone(zone: playerState.fieldZone),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleCardZone(zone: playerState.mainMonsterZone1),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            SingleCardZone(zone: playerState.mainMonsterZone2),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            SingleCardZone(zone: playerState.mainMonsterZone3),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MultiCardZone(
              zone: playerState.graveyardZone,
              showCardBack: false,
            ),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            MultiCardZone(
              zone: playerState.banishedZone,
              showCardBack: false,
            ),
          ],
        ),
      ],
    );
  }
}
