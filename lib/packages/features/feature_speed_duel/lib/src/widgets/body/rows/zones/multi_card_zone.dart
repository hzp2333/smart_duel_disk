import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/helpers/speed_duel_event_animation_handler.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../../../../speed_duel_viewmodel.dart';
import 'cards/player_card.dart';
import 'cards/speed_duel_animation_container.dart';
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

    // TODO: find a better way to inject this dependency.
    // Can't use Provider because the dependency might not exist in the context.
    // Maybe provide it at root level? But then the entire app can access it...
    final animationHandler = di.get<SpeedDuelEventAnimationHandler>();
    final animationStream = animationHandler.animationEvents.where(
      (anim) => anim is ZoneAnimation && anim.zoneType == zone.zoneType && anim.duelistId == playerState.duelistId,
    );

    return CardDragTarget(
      zone: zone,
      child: GestureDetector(
        onTap: onPressed,
        child: SpeedDuelAnimationContainer(
          animationStream: animationStream,
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
                RotatedBox(
                  quarterTurns: playerState.isOpponent ? 2 : 0,
                  child: BorderedText(text: amountOfCards),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
