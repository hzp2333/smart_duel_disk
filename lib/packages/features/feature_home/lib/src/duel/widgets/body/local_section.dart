import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../duel_viewmodel.dart';

class LocalSection extends StatelessWidget with ProviderMixin {
  const LocalSection();

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Section(
      title: stringProvider.getString(LocaleKeys.duel_form_speed_duel_local_title),
      child: const _DuelDemoSection(),
    );
  }
}

class _DuelDemoSection extends StatelessWidget {
  const _DuelDemoSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _IpAddressTextField(),
        SizedBox(height: AppSizes.screenMarginSmall),
        _PortTextField(),
        SizedBox(height: AppSizes.screenMarginLarge),
        _DuelRoomButton(),
      ],
    );
  }
}

class _IpAddressTextField extends StatelessWidget with ProviderMixin {
  const _IpAddressTextField();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelViewModel>(context);
    final stringProvider = getStringProvider(context);

    return TextFieldWithValidation(
      label: stringProvider.getString(LocaleKeys.duel_form_label_ip_address),
      hint: stringProvider.getString(LocaleKeys.duel_form_hint_ip_address),
      textStream: vm.ipAddress,
      onChanged: vm.onIpAddressChanged,
      onSubmitted: vm.onIpAddressSubmitted,
    );
  }
}

class _PortTextField extends StatelessWidget with ProviderMixin {
  const _PortTextField();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelViewModel>(context);
    final stringProvider = getStringProvider(context);

    return TextFieldWithValidation(
      label: stringProvider.getString(LocaleKeys.duel_form_label_port),
      hint: stringProvider.getString(LocaleKeys.duel_form_hint_port),
      textStream: vm.port,
      onChanged: vm.onPortChanged,
      onSubmitted: vm.onPortSubmitted,
    );
  }
}

class _DuelRoomButton extends HookWidget with ProviderMixin {
  const _DuelRoomButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelViewModel>(context);
    final stringProvider = getStringProvider(context);
    final snapshot = useStream(vm.isFormValid, initialData: false);

    return IconTitleTileButton(
      icon: Icons.house,
      title: stringProvider.getString(LocaleKeys.duel_form_enter_local_duel_room),
      onPressed: snapshot.data! ? vm.onEnterLocalDuelRoomPressed : null,
    );
  }
}
