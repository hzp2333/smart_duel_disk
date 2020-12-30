import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../home_viewmodel.dart';
import 'home_screen.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => di.get<HomeViewModel>()),
      ],
      child: const HomeScreen(),
    );
  }
}
