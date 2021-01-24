import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

import 'widgets/personal_decks.dart';
import 'widgets/pre_built_decks.dart';

class DeckScreen extends StatelessWidget {
  const DeckScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.screenMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Section(
            title: Strings.deckPreBuiltDecksTitle.get(),
            child: const PreBuiltDecks(),
          ),
          const SizedBox(height: AppDimensions.deckSectionSeparator),
          Section(
            title: Strings.deckPersonalDecksTitle.get(),
            child: const PersonalDecks(),
          ),
        ],
      ),
    );
  }
}
