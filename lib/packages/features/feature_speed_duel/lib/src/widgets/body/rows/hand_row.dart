import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'zones/cards/player_card.dart';
import 'zones/shared/card_drag_target.dart';

class HandRow extends StatelessWidget {
  const HandRow();

  @override
  Widget build(BuildContext context) {
    final playerState = Provider.of<PlayerState>(context);
    final zone = playerState.hand;

    return CardDragTarget(
      zone: zone,
      child: SizedBox.expand(
        child: Center(
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: zone.cards.length,
            itemBuilder: (_, index) => PlayerCardBuilder(card: zone.cards.elementAt(index)),
            separatorBuilder: (_, __) => const SizedBox(width: AppSizes.screenMargin),
          ),
        ),
      ),
    );
  }
}
