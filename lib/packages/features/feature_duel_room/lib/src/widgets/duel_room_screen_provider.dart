import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../duel_room_viewmodel.dart';
import 'duel_room_screen.dart';

class DuelRoomScreenProvider extends StatelessWidget {
  final PreBuiltDeck preBuiltDeck;

  const DuelRoomScreenProvider({
    required this.preBuiltDeck,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DuelRoomViewModel>(
          create: (_) => di.get<DuelRoomViewModel>(param1: preBuiltDeck),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: const DuelRoomScreen(),
    );
  }
}
