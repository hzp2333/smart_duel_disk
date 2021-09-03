import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

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
    final playerState = Provider.of<PlayerState>(context);

    final actions = vm
        .getDeckActions()
        .map(
          (action) => PopupMenuItem<DeckAction>(
            value: action,
            child: _DeckZoneMenuItem(
              title: action.title,
              icon: action.icon,
            ),
          ),
        )
        .toList();

    return CardDragTarget(
      zone: zone,
      child: PopupMenuButtonWithCallback<DeckAction>(
        enabled: !playerState.isOpponent,
        onPressed: vm.onDeckPressed,
        onSelected: vm.onDeckActionSelected,
        tooltip: playerState.isOpponent ? "Opponent's deck" : 'Show deck actions',
        padding: EdgeInsets.zero,
        itemBuilder: (_) => actions,
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
