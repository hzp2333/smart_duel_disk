import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'widgets/personal_decks.dart';
import 'widgets/pre_built_decks.dart';

class DeckScreen extends StatelessWidget with ProviderMixin {
  const DeckScreen();

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(AppSizes.screenMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Section(
            title: stringProvider.getString(LocaleKeys.deck_pre_built_decks_title),
            child: const PreBuiltDecks(),
          ),
          const SizedBox(height: AppSizes.deckSectionSeparator),
          Section(
            title: stringProvider.getString(LocaleKeys.deck_personal_decks_title),
            child: const PersonalDecks(),
          ),
        ],
      ),
    );
  }
}
