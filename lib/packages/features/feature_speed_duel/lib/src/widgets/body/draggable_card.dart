import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';

import 'speed_duel_field_zones.dart';

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
    final childWhenDragging = zone.zoneType == ZoneType.hand
        ? const ZoneFiller()
        : ZoneBackground(
            zoneType: card.zoneType,
          );

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
      childWhenDragging: childWhenDragging,
      child: CardImage(
        playCard: card,
        placeholderImage: cardBack,
        onCardTapped: () => vm.onCardPressed(card),
      ),
    );
  }
}

class ZoneFiller extends StatelessWidget {
  const ZoneFiller();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppDimensions.yugiohCardAspectRatio,
      child: SizedBox(height: context.playCardHeight),
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
    final quarterTurns = playCard.position.isAttack ? 0 : 3;
    final zoneHeight = context.playCardHeight;
    final zoneWidth = playCard.zoneType.isMainMonsterZone || playCard.zoneType.isSpellTrapCardZone ? zoneHeight : null;
    final cardSleeve = ImagePlaceholder(imageAssetId: placeholderImage);

    return GestureDetector(
      onTap: onCardTapped,
      child: SizedBox(
        height: zoneHeight,
        width: zoneWidth,
        child: Center(
          child: RotatedBox(
            quarterTurns: quarterTurns,
            child: playCard.position.isFaceUp
                ? CachedNetworkImage(
                    imageUrl: playCard.yugiohCard.imageSmallUrl,
                    placeholder: (_, __) => cardSleeve,
                    errorWidget: (_, __, dynamic ___) => cardSleeve,
                  )
                : cardSleeve,
          ),
        ),
      ),
    );
  }
}
