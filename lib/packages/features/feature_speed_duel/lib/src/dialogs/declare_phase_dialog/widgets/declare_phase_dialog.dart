import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intersperse/intersperse.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/declare_phase_dialog/models/declare_phase_dialog_action.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../declare_phase_dialog_viewmodel.dart';

class DeclarePhaseDialog extends StatelessWidget {
  const DeclarePhaseDialog();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeclarePhaseDialogViewModel>(context);

    final actions = vm.getDialogActions().map((action) => _DuelPhaseItem(action: action));
    final actionsAndSeparators = intersperse(const _DuelPhaseActionSeparator(), actions).toList();

    return Center(
      child: Card(
        margin: EdgeInsets.zero,
        color: AppColors.cardDialogBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.screenMargin),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 2 / 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: actionsAndSeparators,
                ),
                const SizedBox(height: 32.0),
                const _EndTurnButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DuelPhaseItem extends StatelessWidget {
  final DeclarePhaseDialogAction action;

  const _DuelPhaseItem({
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeclarePhaseDialogViewModel>(context);

    final borderColor = action.selected ? Colors.blueAccent.shade400 : Colors.transparent;
    final iconColor = action.selected
        ? Colors.blueAccent.shade100
        : action.enabled
            ? Colors.white
            : Colors.grey.shade700;

    return InkWell(
      onTap: action.enabled && !action.selected ? () => vm.onActionPressed(action) : null,
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            width: 2.0,
            color: borderColor,
          ),
        ),
        child: Column(
          children: [
            Icon(
              action.icon,
              color: iconColor,
            ),
            const SizedBox(height: 12.0),
            BorderedText(
              text: action.name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DuelPhaseActionSeparator extends StatelessWidget {
  const _DuelPhaseActionSeparator();

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.play,
      size: 18.0,
      color: Colors.yellow.shade100,
    );
  }
}

class _EndTurnButton extends StatelessWidget {
  const _EndTurnButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeclarePhaseDialogViewModel>(context);

    return MaterialButton(
      onPressed: vm.onEndTurnPressed,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      height: AppSizes.buttonHeight,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.redAccent,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(90.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: const BorderedText(
        text: 'Pass Turn',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
