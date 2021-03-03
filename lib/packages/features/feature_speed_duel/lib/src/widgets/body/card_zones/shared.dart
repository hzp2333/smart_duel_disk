import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../../speed_duel_viewmodel.dart';

class EmptyZone extends StatelessWidget {
  const EmptyZone();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppDimensions.yugiohCardAspectRatio,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class CardDragTarget extends StatelessWidget {
  final Zone zone;
  final Widget child;

  const CardDragTarget({
    @required this.zone,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return DragTarget<PlayCard>(
      onWillAccept: (card) => vm.onWillAccept(card, zone),
      onAccept: (card) => vm.onAccept(card, zone),
      builder: (_, __, ___) => child,
    );
  }
}