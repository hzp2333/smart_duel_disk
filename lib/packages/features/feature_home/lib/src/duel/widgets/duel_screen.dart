import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/duel_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class DuelScreen extends StatelessWidget {
  const DuelScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.screenMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Section(
            title: 'Duel demo',
            child: _DuelDemoSection(),
          ),
        ],
      ),
    );
  }
}

class _DuelDemoSection extends StatelessWidget {
  const _DuelDemoSection();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelViewModel>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconTitleTile(
          icon: Icons.credit_card,
          title: 'Draw card demo',
          onPressed: vm.onDrawCardDemoPressed,
        ),
        const SizedBox(height: AppDimensions.iconTitleTileSeparator),
        IconTitleTile(
          icon: Icons.speed,
          title: 'Speed Duel demo',
          onPressed: vm.onSpeedDuelDemoPressed,
        ),
      ],
    );
  }
}
