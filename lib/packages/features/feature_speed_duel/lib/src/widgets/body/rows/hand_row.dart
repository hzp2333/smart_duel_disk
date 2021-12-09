import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'zones/cards/player_card.dart';
import 'zones/shared/card_drag_target.dart';

class HandRow extends StatelessWidget {
  const HandRow();

  @override
  Widget build(BuildContext context) {
    final playerState = Provider.of<PlayerState>(context);
    final zone = playerState.hand;

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        CardDragTarget(
          zone: zone,
          child: Center(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: zone.cards.length,
              itemBuilder: (_, index) => PlayerCardBuilder(card: zone.cards.elementAt(index)),
              separatorBuilder: (_, __) => const SizedBox(width: 12.0),
            ),
          ),
        ),
        Positioned(
          child: _LifepointsContainer(playerState: playerState),
        ),
      ],
    );
  }
}

class _LifepointsContainer extends StatelessWidget {
  final PlayerState playerState;

  const _LifepointsContainer({
    required this.playerState,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: playerState.isOpponent ? null : vm.onLifepointsPressed,
        borderRadius: BorderRadius.circular(8.0),
        child: RotatedBox(
          quarterTurns: playerState.isOpponent ? 2 : 0,
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.screenMarginSmall),
            child: _Lifepoints(lifepoints: playerState.lifepoints.toString()),
          ),
        ),
      ),
    );
  }
}

class _Lifepoints extends StatelessWidget {
  final String lifepoints;

  const _Lifepoints({
    required this.lifepoints,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        const BorderedText(
          text: 'LP: ',
          style: TextStyle(fontSize: 18.0),
        ),
        BorderedText(
          text: lifepoints,
          style: const TextStyle(fontSize: 26.0),
        ),
      ],
    );
  }
}
