import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'zones/deck_zone.dart';
import 'zones/multi_card_zone.dart';
import 'zones/shared/zone_filler.dart';
import 'zones/single_card_zone.dart';

class SpellTrapRow extends StatelessWidget {
  const SpellTrapRow();

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
            MultiCardZone(
              zone: playerState.extraDeckZone,
              showCardBack: true,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleCardZone(zone: playerState.spellTrapZone1),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            SingleCardZone(zone: playerState.spellTrapZone2),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            SingleCardZone(zone: playerState.spellTrapZone3),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DeckZone(zone: playerState.deckZone),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            const ZoneFiller(),
          ],
        ),
      ],
    );
  }
}
