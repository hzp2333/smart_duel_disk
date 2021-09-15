import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../duel_viewmodel.dart';

class OnlineSection extends StatelessWidget with ProviderMixin {
  const OnlineSection();

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Section(
      title: stringProvider.getString(LocaleKeys.duel_form_speed_duel_online_title),
      child: const _DuelRoomButton(),
    );
  }
}

class _DuelRoomButton extends StatelessWidget with ProviderMixin {
  const _DuelRoomButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelViewModel>(context);
    final stringProvider = getStringProvider(context);

    return IconTitleTileButton(
      icon: Icons.business,
      title: stringProvider.getString(LocaleKeys.duel_form_enter_online_duel_room),
      onPressed: vm.onEnterOnlineDuelRoomPressed,
    );
  }
}
