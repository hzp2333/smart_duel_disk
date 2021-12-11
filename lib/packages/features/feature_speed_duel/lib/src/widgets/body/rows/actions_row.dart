import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_models.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/speed_duel_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'zones/shared/zone_filler.dart';

class ActionsRow extends StatelessWidget {
  final SpeedDuelState duelState;

  const ActionsRow({
    required this.duelState,
  });

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
            _IconAction(
              icon: FontAwesomeIcons.bitcoin,
              hint: 'Flip coin',
              onPressed: vm.onFlipCoinPressed,
            ),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            _DuelPhaseButton(duelState: duelState),
            const SizedBox(width: AppSizes.duelFieldCardSpacing),
            _IconAction(
              icon: FontAwesomeIcons.dice,
              hint: 'Roll dice',
              onPressed: vm.onRollDicePressed,
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

class _IconAction extends StatelessWidget {
  final IconData icon;
  final String hint;
  final VoidCallback onPressed;

  const _IconAction({
    required this.icon,
    required this.hint,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.playCardHeight,
      child: IconButton(
        onPressed: onPressed,
        tooltip: hint,
        color: Colors.white,
        iconSize: context.screenHeight * 0.07,
        splashRadius: 24.0,
        icon: Icon(icon),
      ),
    );
  }
}

class _DuelPhaseButton extends StatelessWidget {
  final SpeedDuelState duelState;

  const _DuelPhaseButton({
    required this.duelState,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    final onTap = duelState.isUsersTurn ? vm.onDuelPhasePressed : null;
    final shortPhaseName = duelState.duelPhase.duelPhaseType.shortName;
    final accentColor = duelState.isUsersTurn ? Colors.blueAccent : Colors.redAccent;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: context.playCardHeight,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          border: Border.all(color: accentColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: BorderedText(
            text: shortPhaseName,
            style: TextStyle(
              color: accentColor,
              fontSize: context.screenHeight * 0.055,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
