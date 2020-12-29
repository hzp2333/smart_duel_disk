import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../duel_viewmodel.dart';
import 'duel_screen.dart';

class DuelScreenProvider extends StatelessWidget {
  const DuelScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => DuelViewModel()),
      ],
      child: const DuelScreen(),
    );
  }
}
