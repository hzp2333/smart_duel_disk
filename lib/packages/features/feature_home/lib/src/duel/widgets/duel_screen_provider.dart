import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../duel_viewmodel.dart';
import 'duel_screen.dart';

class DuelScreenProvider extends StatelessWidget {
  const DuelScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => di.get<DuelViewModel>()),
      ],
      child: const DuelScreen(),
    );
  }
}
