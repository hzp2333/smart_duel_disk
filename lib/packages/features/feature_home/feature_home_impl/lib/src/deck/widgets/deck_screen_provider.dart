import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../deck_viewmodel.dart';
import 'deck_screen.dart';

class DeckScreenProvider extends StatelessWidget {
  const DeckScreenProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => DeckViewModel()),
      ],
      child: const DeckScreen(),
    );
  }
}
