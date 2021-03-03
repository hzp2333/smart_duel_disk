import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
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
    final assetsProvider = Provider.of<AssetsProvider>(context);

    return Draggable<PlayCard>(
      maxSimultaneousDrags: 1,
      onDragStarted: () {
        HapticFeedback.selectionClick();
        onDragStarted?.call();
      },
      data: card,
      feedback: CardImage(
        imageUrl: card.yugiohCard.imageSmallUrl,
        placeholderAssetId: assetsProvider.cardBack,
      ),
      childWhenDragging: zone.zoneType == ZoneType.hand ? const SizedBox.shrink() : const EmptyZone(),
      child: CardImage(
        imageUrl: card.yugiohCard.imageSmallUrl,
        placeholderAssetId: assetsProvider.cardBack,
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final String imageUrl;
  final String placeholderAssetId;

  const CardImage({
    @required this.imageUrl,
    @required this.placeholderAssetId,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fitHeight,
      placeholder: (_, __) => ImagePlaceholder(imageAssetId: placeholderAssetId),
      errorWidget: (_, __, dynamic ___) => ImagePlaceholder(imageAssetId: placeholderAssetId),
    );
  }
}
