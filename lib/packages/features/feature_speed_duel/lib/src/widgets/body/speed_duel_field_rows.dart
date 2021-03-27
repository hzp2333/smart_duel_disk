import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'draggable_card.dart';
import 'speed_duel_field_zones.dart';

class MainMonsterRow extends StatelessWidget {
  final PlayerState playerState;

  const MainMonsterRow({
    @required this.playerState,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ZoneFiller(),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            SingleCardFieldZone(zone: playerState.fieldZone),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleCardFieldZone(zone: playerState.mainMonsterZone1),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            SingleCardFieldZone(zone: playerState.mainMonsterZone2),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            SingleCardFieldZone(zone: playerState.mainMonsterZone3),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MultiCardFieldZone(
              zone: playerState.graveyardZone,
              showCardBack: false,
            ),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            MultiCardFieldZone(
              zone: playerState.banishedZone,
              showCardBack: false,
            ),
          ],
        ),
      ],
    );
  }
}

class SpellTrapRow extends StatelessWidget {
  final PlayerState playerState;

  const SpellTrapRow({
    @required this.playerState,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ZoneFiller(),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            MultiCardFieldZone(
              zone: playerState.extraDeckZone,
              showCardBack: true,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleCardFieldZone(zone: playerState.spellTrapZone1),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            SingleCardFieldZone(zone: playerState.spellTrapZone2),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            SingleCardFieldZone(zone: playerState.spellTrapZone3),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DeckZone(zone: playerState.deckZone),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            const ZoneFiller(),
          ],
        ),
      ],
    );
  }
}

class HandRow extends StatelessWidget {
  final Zone zone;

  const HandRow({
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
