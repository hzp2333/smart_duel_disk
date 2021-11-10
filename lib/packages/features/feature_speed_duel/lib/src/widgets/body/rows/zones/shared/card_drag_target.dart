import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';

import '../../../../../speed_duel_viewmodel.dart';

class CardDragTarget extends StatelessWidget {
  final Zone zone;
  final Widget child;

  const CardDragTarget({
    required this.zone,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return DragTarget<PlayCard>(
      onWillAccept: (card) => vm.onWillZoneAcceptCard(card!, zone),
      onAccept: (card) => vm.onZoneAcceptsCard(card, zone),
      builder: (_, __, ___) => child,
    );
  }
}
