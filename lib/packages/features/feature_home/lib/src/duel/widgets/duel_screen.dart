import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/duel_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'body/duel_form_textfield.dart';

class DuelScreen extends StatelessWidget {
  const DuelScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.screenMargin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _IpAddressTextField(),
          SizedBox(height: 12),
          _PortTextField(),
          SizedBox(height: 18),
          _DuelFormSubmitButton(),
        ],
      ),
    );
  }
}

class _IpAddressTextField extends StatelessWidget {
  const _IpAddressTextField();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelViewModel>(context);

    return DuelFormTextField(
      label: 'IP Address',
      hint: '192.168.0.100',
      textStream: vm.ipAddress,
      onChanged: vm.onIpAddressChanged,
      onSubmitted: vm.onIpAddressSubmitted,
    );
  }
}

class _PortTextField extends StatelessWidget {
  const _PortTextField();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelViewModel>(context);

    return DuelFormTextField(
      label: 'Port',
      hint: '52300',
      textStream: vm.port,
      onChanged: vm.onPortChanged,
      onSubmitted: vm.onPortSubmitted,
    );
  }
}

class _DuelFormSubmitButton extends HookWidget {
  const _DuelFormSubmitButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelViewModel>(context);
    final snapshot = useStream(vm.isFormValid, initialData: false);

    return IconTitleTile(
      icon: Icons.speed,
      title: 'Speed Duel demo',
      onPressed: snapshot.data ? vm.onSpeedDuelDemoPressed : null,
    );
  }
}
