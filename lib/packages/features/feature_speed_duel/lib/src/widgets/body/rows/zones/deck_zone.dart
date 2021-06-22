import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/deck_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

import '../../../../speed_duel_viewmodel.dart';
import 'multi_card_zone.dart';
import 'shared/card_drag_target.dart';

class DeckZone extends StatelessWidget {
  final Zone zone;

  const DeckZone({
    @required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return CardDragTarget(
      zone: zone,
      child: PopupMenuButton<DeckAction>(
        onSelected: vm.onDeckActionSelected,
        tooltip: 'Show deck actions',
        padding: EdgeInsets.zero,
        itemBuilder: (context) => [
          const PopupMenuItem<DeckAction>(
            value: DeckAction.drawCard,
            child: _DeckZoneMenuItem(
              title: 'Draw card',
              icon: Icons.credit_card,
            ),
          ),
          const PopupMenuItem<DeckAction>(
            value: DeckAction.spawnToken,
            child: _DeckZoneMenuItem(
              title: 'Summon token',
              icon: Icons.adb,
            ),
          ),
          const PopupMenuItem<DeckAction>(
            value: DeckAction.showDeckList,
            child: _DeckZoneMenuItem(
              title: 'Show deck list',
              icon: Icons.view_carousel_rounded,
            ),
          ),
          const PopupMenuItem<DeckAction>(
            value: DeckAction.shuffleDeck,
            child: _DeckZoneMenuItem(
              title: 'Shuffle deck',
              icon: Icons.shuffle,
            ),
          ),
          const PopupMenuItem<DeckAction>(
            value: DeckAction.surrender,
            child: _DeckZoneMenuItem(
              title: 'Surrender',
              icon: Icons.flag,
            ),
          ),
        ],
        child: MultiCardZone(
          zone: zone,
          showCardBack: true,
        ),
      ),
    );
  }
}

class _DeckZoneMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _DeckZoneMenuItem({
    @required this.title,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
