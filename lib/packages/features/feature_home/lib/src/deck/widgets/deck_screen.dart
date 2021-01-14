import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../deck_viewmodel.dart';

class DeckScreen extends StatelessWidget {
  const DeckScreen();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckViewModel>(context);

    return const Center(
      child: Text(
        'Deck screen',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
