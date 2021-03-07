import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/widgets/body/card_zones/shared.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';

class DraggableCard extends StatelessWidget {
  final PlayCard card;
  final Zone zone;
  final VoidCallback onDragStarted;

  const DraggableCard({
    @required this.card,
    @required this.zone,
    this.onDragStarted,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);
    final assetsProvider = Provider.of<AssetsProvider>(context);
    final cardBack = assetsProvider.cardBack;

    return Draggable<PlayCard>(
      maxSimultaneousDrags: 1,
      onDragStarted: () {
        HapticFeedback.selectionClick();
        onDragStarted?.call();
      },
      data: card,
      feedback: CardImage(
        playCard: card,
        placeholderImage: cardBack,
      ),
      childWhenDragging: zone.zoneType == ZoneType.hand ? const SizedBox.shrink() : const EmptyZone(),
      child: CardImage(
        playCard: card,
        placeholderImage: cardBack,
        onCardTapped: () => vm.onCardPressed(card),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final PlayCard playCard;
  final String placeholderImage;
  final VoidCallback onCardTapped;

  const CardImage({
    @required this.playCard,
    @required this.placeholderImage,
    this.onCardTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTapped,
      child: CachedNetworkImage(
        imageUrl: playCard.yugiohCard.imageSmallUrl,
        fit: BoxFit.fitHeight,
        placeholder: (_, __) => ImagePlaceholder(imageAssetId: placeholderImage),
        errorWidget: (_, __, dynamic ___) => ImagePlaceholder(imageAssetId: placeholderImage),
      ),
    );
  }
}
