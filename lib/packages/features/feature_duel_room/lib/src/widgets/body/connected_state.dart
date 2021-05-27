import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/widgets/body/duel_form_textfield.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../duel_room_viewmodel.dart';

class ConnectedState extends StatelessWidget {
  const ConnectedState();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _CreateRoomButton(),
          SizedBox(height: 24),
          _CreateEnterRoomSeparator(),
          SizedBox(height: 24),
          _EnterRoomTextField(),
          SizedBox(height: 12),
          _EnterRoomButton(),
        ],
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelRoomViewModel>(context);

    return IconTitleTileButton(
      icon: Icons.add_business,
      title: 'Create room',
      onPressed: vm.onCreateRoomPressed,
    );
  }
}

class _CreateEnterRoomSeparator extends StatelessWidget {
  const _CreateEnterRoomSeparator();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '--- OR ---',
      style: TextStyle(
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

class _EnterRoomTextField extends StatelessWidget {
  const _EnterRoomTextField();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelRoomViewModel>(context);

    // TODO: add to ui_components
    return DuelFormTextField(
      label: 'Room name',
      hint: 'K41B4',
      textStream: vm.roomName,
      onChanged: vm.onRoomNameChanged,
      onSubmitted: vm.onRoomNameSubmitted,
    );
  }
}

class _EnterRoomButton extends StatelessWidget {
  const _EnterRoomButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelRoomViewModel>(context);

    return IconTitleTileButton(
      icon: Icons.meeting_room,
      title: 'Enter room',
      onPressed: vm.onJoinRoomPressed,
    );
  }
}
