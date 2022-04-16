import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/deck/deck.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../deck_viewmodel.dart';
import 'deck_screen.dart';

class DeckScreenProvider extends StatelessWidget {
  final DeckScreenParameters screenParams;

  const DeckScreenProvider({
    required this.screenParams,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => di.get<DeckViewModel>(param1: screenParams)),
      ],
      child: const DeckScreen(),
    );
  }
}
