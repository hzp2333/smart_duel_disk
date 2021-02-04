import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../speed_duel_viewmodel.dart';
import 'speed_duel_screen.dart';

class SpeedDuelScreenProvider extends StatelessWidget {
  final PreBuiltDeck preBuiltDeck;

  const SpeedDuelScreenProvider({
    @required this.preBuiltDeck,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SpeedDuelViewModel>(
          create: (_) => di.get<SpeedDuelViewModel>(param1: preBuiltDeck),
          dispose: (_, vm) => vm.dispose(),
        ),
        Provider(create: (_) => di.get<AssetsProvider>()),
      ],
      child: const SpeedDuelScreen(),
    );
  }
}
