import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../duel_viewmodel.dart';

class OnlineSection extends StatelessWidget {
  const OnlineSection();

  @override
  Widget build(BuildContext context) {
    return const Section(
      title: 'Speed Duel',
      child: _DuelRoomButton(),
    );
  }
}

class _DuelRoomButton extends StatelessWidget {
  const _DuelRoomButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelViewModel>(context);

    return IconTitleTileButton(
      icon: Icons.business,
      title: 'Enter Duel Room',
      onPressed: vm.onEnterOnlineDuelRoomPressed,
    );
  }
}
