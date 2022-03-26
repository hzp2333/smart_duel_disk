import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../duel_room_viewmodel.dart';
import 'duel_room_screen.dart';

class DuelRoomScreenProvider extends StatelessWidget {
  const DuelRoomScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DuelRoomViewModel>(
          create: (_) => di.get<DuelRoomViewModel>(),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: const DuelRoomScreen(),
    );
  }
}
