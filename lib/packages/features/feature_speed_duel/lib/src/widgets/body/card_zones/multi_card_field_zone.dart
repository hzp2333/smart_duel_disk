import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';

import '../../../speed_duel_viewmodel.dart';
import '../draggable_card.dart';
import 'shared.dart';

class MultiCardFieldZone extends StatelessWidget {
  final Zone zone;
  final bool showCardBack;

  const MultiCardFieldZone({
    @required this.zone,
    @required this.showCardBack,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);
    final assetsProvider = Provider.of<AssetsProvider>(context);

    final cardBack = assetsProvider.cardBack;
    final amountOfCards = zone.cards.length.toString();

    final onPressed = zone.zoneType == ZoneType.deck ? null : () => vm.onMultiCardZonePressed(zone);

    return CardDragTarget(
      zone: zone,
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (zone.cards.isEmpty) ...{
              const EmptyZone(),
            } else if (showCardBack) ...{
              ImagePlaceholder(imageAssetId: cardBack),
            } else ...{
              CardImage(
                playCard: zone.cards.last,
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
