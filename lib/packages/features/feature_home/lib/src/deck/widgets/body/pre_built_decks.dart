import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/deck/deck_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'deck_list_item.dart';

class PreBuiltDecksSection extends StatelessWidget with ProviderMixin {
  const PreBuiltDecksSection();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckViewModel>(context);
    final stringProvider = getStringProvider(context);

    final deckCards = vm
        .getPreBuiltDecks()
        .map(
          (deck) => Expanded(
            child: DeckListItem(
              backgroundColor: deck.backgroundColor,
              image: Image.asset(
                deck.imageUrl,
                fit: BoxFit.fitHeight,
                alignment: Alignment.topCenter,
              ),
              deckName: stringProvider.getString(deck.titleId),
              onPressed: () => vm.onPreBuiltDeckPressed(deck),
            ),
          ),
        )
        .toList();

    const spacing = SizedBox(width: AppSizes.deckPrebBuiltCardSeparator);

    final deckCardsAndSpacings = intersperse(spacing, deckCards).toList();

    return Row(
      children: deckCardsAndSpacings,
    );
  }
}
