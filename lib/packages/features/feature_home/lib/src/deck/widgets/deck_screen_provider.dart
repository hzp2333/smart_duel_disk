import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../deck_viewmodel.dart';
import 'deck_screen.dart';

class DeckScreenProvider extends StatelessWidget {
  const DeckScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => di.get<DeckViewModel>()),
      ],
      child: const DeckScreen(),
    );
  }
}
