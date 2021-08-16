import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/widgets/body/online_section.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../duel_viewmodel.dart';
import 'body/local_section.dart';

class DuelScreen extends StatefulWidget {
  const DuelScreen();

  @override
  _DuelScreenState createState() => _DuelScreenState();
}

class _DuelScreenState extends State<DuelScreen> {
  @override
  void initState() {
    super.initState();

    final vm = Provider.of<DuelViewModel>(context, listen: false);
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelViewModel>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.screenMargin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OnlineSection(),
          if (vm.isLocalDuelRoomAvailable) ...{
            const SizedBox(height: 48),
            const LocalSection(),
          },
        ],
      ),
    );
  }
}
