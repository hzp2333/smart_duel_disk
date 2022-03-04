import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import 'deck_builder_screen.dart';

class DeckBuilderScreenProvider extends StatelessWidget {
  final PreBuiltDeck? preBuiltDeck;
  final UserDeck? userDeck;

  const DeckBuilderScreenProvider({
    this.preBuiltDeck,
    this.userDeck,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DeckBuilderViewModel>(
          create: (_) => di.get<DeckBuilderViewModel>(param1: preBuiltDeck, param2: userDeck),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: const DeckBuilderScreen(),
    );
  }
}
