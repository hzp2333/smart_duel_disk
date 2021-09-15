import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/features/feature_duel_room/lib/src/models/duel_room_state.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../duel_room_viewmodel.dart';
import 'body/connected_state.dart';
import 'body/create_room_state.dart';

class DuelRoomScreen extends StatelessWidget with ProviderMixin {
  const DuelRoomScreen();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelRoomViewModel>(context);
    final stringProvider = getStringProvider(context);

    return WillPopScope(
      onWillPop: vm.onWillPop,
      child: Scaffold(
        appBar: SddAppBar(title: stringProvider.getString(LocaleKeys.duel_room_title)),
        body: const _Body(),
        backgroundColor: AppColors.primaryBackgroundColor,
      ),
    );
  }
}

class _Body extends HookWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelRoomViewModel>(context);
    final duelRoomState = useStream(vm.roomState, initialData: const DuelRoomConnecting());

    return Padding(
      padding: const EdgeInsets.all(AppSizes.screenMargin),
      child: duelRoomState.data!.when(
        connecting: () => const GeneralLoadingState(),
        connected: () => const ConnectedState(),
        createRoom: (roomName) => CreateRoomState(roomName: roomName),
        joinRoom: (roomName) => const SizedBox.shrink(),
        ready: () => const SizedBox.shrink(),
        error: (errorMessage, retryAction) => GeneralErrorState(
          description: errorMessage,
          canRetry: true,
          retryAction: retryAction,
        ),
      ),
    );
  }
}
