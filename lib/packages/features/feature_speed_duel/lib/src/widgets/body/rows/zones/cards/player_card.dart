import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_animation_handler.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/widgets/body/rows/zones/shared/zone_background.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/widgets/body/rows/zones/shared/zone_filler.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import 'speed_duel_animation_container.dart';

class PlayerCardBuilder extends StatelessWidget {
  final PlayCard card;

  const PlayerCardBuilder({
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);
    final playerState = Provider.of<PlayerState>(context);

    final cardBack = Assets.illustrations.cardBack.path;

    if (playerState.isOpponent) {
      return PlayCardImage(
        playCard: card,
        playerState: playerState,
        placeholderImage: cardBack,
        onCardTapped: () => vm.onCardPressed(card),
      );
    }

    return _DraggableCard(
      card: card,
      playerState: playerState,
      placeholderImage: cardBack,
      onCardTapped: () => vm.onCardPressed(card),
    );
  }
}

class _DraggableCard extends StatelessWidget {
  final PlayCard card;
  final PlayerState playerState;
  final String placeholderImage;
  final VoidCallback onCardTapped;

  const _DraggableCard({
    required this.card,
    required this.playerState,
    required this.placeholderImage,
    required this.onCardTapped,
  });

  @override
  Widget build(BuildContext context) {
    final childWhenDragging =
        card.zoneType == ZoneType.hand ? const ZoneFiller() : ZoneBackground(zoneType: card.zoneType);

    return Draggable<PlayCard>(
      maxSimultaneousDrags: 1,
      onDragStarted: () => HapticFeedback.selectionClick(),
      data: card,
      feedback: PlayCardImage(
        playCard: card,
        playerState: playerState,
        placeholderImage: placeholderImage,
      ),
      childWhenDragging: childWhenDragging,
      child: PlayCardImage(
        playCard: card,
        playerState: playerState,
        placeholderImage: placeholderImage,
        onCardTapped: onCardTapped,
      ),
    );
  }
}

class PlayCardImage extends StatelessWidget {
  final PlayCard playCard;
  final PlayerState playerState;
  final String placeholderImage;
  final VoidCallback? onCardTapped;

  PlayCardImage({
    required this.playCard,
    required this.playerState,
    required this.placeholderImage,
    this.onCardTapped,
  }) : super(key: ValueKey(playCard));

  @override
  Widget build(BuildContext context) {
    final quarterTurns = playCard.position.isAttack ? 0 : 3;
    final cardSleeve = ImagePlaceholder(imageAssetId: placeholderImage);

    final zoneHeight = context.playCardHeight;
    final zoneWidth = playCard.zoneType.isMainMonsterZone || playCard.zoneType.isSpellTrapCardZone
        ? zoneHeight
        : zoneHeight * AppSizes.yugiohCardAspectRatio;

    final showImage = playCard.position.isFaceUp &&
        ((!playerState.isOpponent && !playCard.revealed) ||
            (playerState.isOpponent &&
                (playCard.zoneType != ZoneType.hand || (playCard.zoneType == ZoneType.hand && playCard.revealed))));

    // TODO: find a better way to inject this dependency.
    // Can't use Provider because the dependency might not exist in the context.
    // Maybe provide it at root level? But then the entire app can access it...
    final animationHandler = di.get<SpeedDuelEventAnimationHandler>();
    final animationStream = animationHandler.animationEvents.where(
      (anim) =>
          anim is CardAnimation &&
          anim.cardId == playCard.yugiohCard.id &&
          anim.copyNumber == playCard.copyNumber &&
          anim.duelistId == playCard.duelistId,
    );

    return GestureDetector(
      onTap: onCardTapped,
      child: SizedBox(
        height: zoneHeight,
        width: zoneWidth,
        child: Center(
          child: SpeedDuelAnimationContainer(
            animationStream: animationStream,
            child: RotatedBox(
              quarterTurns: quarterTurns,
              child: showImage
                  ? Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CardImage(
                          card: playCard.yugiohCard,
                          image: playCard.image,
                        ),
                        Positioned(
                          right: 4,
                          bottom: 4,
                          child: _PlayCardCounters(
                            playCard: playCard,
                            playerState: playerState,
                          ),
                        ),
                      ],
                    )
                  : cardSleeve,
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayCardCounters extends StatelessWidget {
  final PlayCard playCard;
  final PlayerState playerState;

  const _PlayCardCounters({
    required this.playCard,
    required this.playerState,
  });

  @override
  Widget build(BuildContext context) {
    if (playCard.counters <= 0) {
      return const SizedBox.shrink();
    }

    final circleSize = context.playCardHeight / 3;
    final quarterTurns = playerState.isOpponent
        ? playCard.position.isAttack
            ? 2
            : 3
        : playCard.position.isAttack
            ? 0
            : 1;

    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(width: 2.5),
        ),
        child: Center(
          child: Text(
            playCard.counters.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: circleSize / 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
