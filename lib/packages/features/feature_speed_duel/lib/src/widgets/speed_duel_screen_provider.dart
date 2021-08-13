import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/lib/wrapper_assets.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../speed_duel_viewmodel.dart';
import 'speed_duel_screen.dart';

class SpeedDuelScreenProvider extends StatelessWidget {
  final DuelRoom duelRoom;

  const SpeedDuelScreenProvider({
    @required this.duelRoom,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SpeedDuelViewModel>(
          create: (_) => di.get<SpeedDuelViewModel>(param1: duelRoom),
          dispose: (_, vm) => vm.dispose(),
        ),
        Provider(create: (_) => di.get<AssetsProvider>()),
      ],
      child: const SpeedDuelScreen(),
    );
  }
}
