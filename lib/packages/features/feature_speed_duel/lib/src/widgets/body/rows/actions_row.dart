import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'zones/shared/zone_filler.dart';

class ActionsRow extends StatelessWidget {
  const ActionsRow();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ZoneFiller(),
            SizedBox(width: AppSizes.duelFieldCardSpacing),
            ZoneFiller(),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: context.playCardHeight,
              child: _Action(
                icon: FontAwesomeIcons.bitcoin,
                hint: 'Flip coin',
                onPressed: vm.onFlipCoinPressed,
              ),
            ),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            SizedBox(width: context.playCardHeight),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            SizedBox(
              width: context.playCardHeight,
              child: _Action(
                icon: FontAwesomeIcons.dice,
                hint: 'Roll die',
                onPressed: vm.onRollDicePressed,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ZoneFiller(),
            SizedBox(width: AppSizes.duelFieldCardSpacing),
            ZoneFiller(),
          ],
        ),
      ],
    );
  }
}

class _Action extends StatelessWidget {
  final IconData icon;
  final String hint;
  final VoidCallback onPressed;

  const _Action({
    required this.icon,
    required this.hint,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: hint,
      color: Colors.white,
      iconSize: context.screenHeight * 0.07,
      splashRadius: 24.0,
      icon: Icon(icon),
    );
  }
}
