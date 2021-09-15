import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../duel_room_viewmodel.dart';

class CreateRoomState extends StatelessWidget {
  final String roomName;

  const CreateRoomState({
    required this.roomName,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Room name: $roomName\n\nWaiting for your opponent...'),
            const SizedBox(height: AppSizes.screenMarginLarge),
            const _CopyRoomCodeButton(),
            const SizedBox(height: AppSizes.screenMargin),
            const _CloseRoomButton(),
          ],
        ),
      ),
    );
  }
}

class _CopyRoomCodeButton extends StatelessWidget {
  const _CopyRoomCodeButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelRoomViewModel>(context);

    return IconTitleTileButton(
      icon: Icons.copy,
      title: 'Copy room code',
      onPressed: vm.onCopyRoomCodePressed,
    );
  }
}

class _CloseRoomButton extends StatelessWidget {
  const _CloseRoomButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelRoomViewModel>(context);

    return IconTitleTileButton(
      icon: Icons.highlight_remove,
      title: 'Close room',
      onPressed: vm.onCloseRoomPressed,
    );
  }
}
