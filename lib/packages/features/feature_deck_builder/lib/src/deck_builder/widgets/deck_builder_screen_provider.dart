import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import '../models/deck_builder_screen_parameters.dart';
import 'deck_builder_screen.dart';

class DeckBuilderScreenProvider extends StatelessWidget {
  final DeckBuilderScreenParameters? screenParameters;

  const DeckBuilderScreenProvider({
    this.screenParameters,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DeckBuilderViewModel>(
          create: (_) => di.get<DeckBuilderViewModel>(param1: screenParameters),
          dispose: (_, vm) => vm.dispose(),
        ),
      ],
      child: const DeckBuilderScreen(),
    );
  }
}
