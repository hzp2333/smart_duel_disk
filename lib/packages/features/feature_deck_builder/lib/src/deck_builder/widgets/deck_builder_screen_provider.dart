import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';
import 'package:smart_duel_disk/src/di/di.dart';

import 'deck_builder_screen.dart';

class DeckBuilderScreenProvider extends StatelessWidget {
  const DeckBuilderScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DeckBuilderViewModel>(
          create: (_) => di.get<DeckBuilderViewModel>(),
          dispose: (_, vm) => vm.dispose(),
        ),
        Provider(create: (_) => di.get<AssetsProvider>()),
      ],
      child: const DeckBuilderScreen(),
    );
  }
}
