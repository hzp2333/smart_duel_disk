import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/widgets/body/rows/zones/shared/zone_background.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/widgets/body/rows/zones/shared/zone_filler.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'card_animation_container.dart';

class PlayerCardBuilder extends StatelessWidget {
  final PlayCard? card;

  const PlayerCardBuilder({
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);
    final playerState = Provider.of<PlayerState>(context);

    final cardBack = Assets.illustrations.cardBack.path;

    if (playerState.isOpponent) {
      return CardImage(
        playCard: card,
        playerState: playerState,
        placeholderImage: cardBack,
        onCardTapped: () => vm.onCardPressed(card!),
      );
    }

    return _DraggableCard(
      playCard: card,
      playerState: playerState,
      placeholderImage: cardBack,
      onCardTapped: () => vm.onCardPressed(card!),
    );
  }
}

class _DraggableCard extends StatelessWidget {
  final PlayCard? playCard;
  final PlayerState playerState;
  final String placeholderImage;
  final VoidCallback onCardTapped;

  const _DraggableCard({
    required this.playCard,
    required this.playerState,
    required this.placeholderImage,
    required this.onCardTapped,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    final childWhenDragging =
        playCard!.zoneType == ZoneType.hand ? const ZoneFiller() : ZoneBackground(zoneType: playCard!.zoneType);

    return Draggable<PlayCard>(
      maxSimultaneousDrags: 1,
      onDragStarted: () => HapticFeedback.selectionClick(),
      data: playCard,
      feedback: CardImage(
        playCard: playCard,
        playerState: playerState,
        placeholderImage: placeholderImage,
      ),
      childWhenDragging: childWhenDragging,
      child: CardImage(
        playCard: playCard,
        playerState: playerState,
        placeholderImage: placeholderImage,
        onCardTapped: () => vm.onCardPressed(playCard!),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final PlayCard? playCard;
  final PlayerState playerState;
  final String placeholderImage;
  final VoidCallback? onCardTapped;

  const CardImage({
    required this.playCard,
    required this.playerState,
    required this.placeholderImage,
    this.onCardTapped,
  });

  @override
  Widget build(BuildContext context) {
    final quarterTurns = playCard!.position.isAttack ? 0 : 3;
    final zoneHeight = context.playCardHeight;
    final zoneWidth = playCard!.zoneType.isMainMonsterZone || playCard!.zoneType.isSpellTrapCardZone
        ? zoneHeight
        : zoneHeight * AppSizes.yugiohCardAspectRatio;
    final cardSleeve = ImagePlaceholder(imageAssetId: placeholderImage);

    final showImage = playCard!.position.isFaceUp &&
        (!playerState.isOpponent || (playerState.isOpponent && playCard!.zoneType != ZoneType.hand));

    return GestureDetector(
      onTap: onCardTapped,
      child: SizedBox(
        height: zoneHeight,
        width: zoneWidth,
        child: Center(
          child: CardAnimationContainer(
            playCard: playCard,
            child: RotatedBox(
              quarterTurns: quarterTurns,
              child: showImage
                  ? CachedNetworkImage(
                      imageUrl: kIsWeb ? playCard!.yugiohCard.imageLargeUrl : playCard!.yugiohCard.imageSmallUrl,
                      placeholder: (_, __) => cardSleeve,
                      // ignore: avoid_annotating_with_dynamic
                      errorWidget: (_, __, dynamic ___) => cardSleeve,
                      fit: BoxFit.contain,
                    )
                  : cardSleeve,
            ),
          ),
        ),
      ),
    );
  }
}
