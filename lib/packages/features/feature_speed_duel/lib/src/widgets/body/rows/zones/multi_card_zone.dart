import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../../../speed_duel_viewmodel.dart';
import 'cards/player_card.dart';
import 'shared/card_drag_target.dart';
import 'shared/zone_background.dart';

class MultiCardZone extends StatelessWidget {
  final Zone zone;
  final bool showCardBack;

  const MultiCardZone({
    required this.zone,
    required this.showCardBack,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);
    final playerState = Provider.of<PlayerState>(context);

    final cardBack = Assets.illustrations.cardBack.path;
    final amountOfCards = zone.cards.length.toString();

    final zoneType = zone.zoneType;
    final onPressed = zoneType == ZoneType.deck
        ? null
        : !playerState.isOpponent ||
                (playerState.isOpponent && (zoneType == ZoneType.graveyard || zoneType == ZoneType.banished))
            ? () => vm.onMultiCardZonePressed(playerState, zone)
            : null;

    return CardDragTarget(
      zone: zone,
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (zone.cards.isEmpty) ...{
              ZoneBackground(zoneType: zone.zoneType),
            } else if (showCardBack) ...{
              ImagePlaceholder(imageAssetId: cardBack),
            } else ...{
              PlayCardImage(
                playCard: zone.cards.last,
                playerState: playerState,
                placeholderImage: cardBack,
              ),
            },
            if (zone.cards.isNotEmpty) ...{
              BorderedText(text: amountOfCards),
            },
          ],
        ),
      ),
    );
  }
}
