import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../deck_viewmodel.dart';
import 'widgets/personal_decks.dart';
import 'widgets/pre_built_decks.dart';

class DeckScreen extends StatelessWidget {
  const DeckScreen();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(AppDimensions.screenMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _Section(
            title: 'Pre-built decks',
            child: PreBuiltDecks(),
          ),
          SizedBox(height: AppDimensions.deckSectionSeparator),
          _Section(
            title: 'Personal decks',
            child: PersonalDecks(),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget child;

  const _Section({
    @required this.title,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.deckSectionTitle,
        ),
        const SizedBox(height: AppDimensions.deckSectionTitleChildSeparator),
        child,
      ],
    );
  }
}
