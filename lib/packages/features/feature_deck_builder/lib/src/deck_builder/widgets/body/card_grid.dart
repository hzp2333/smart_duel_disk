import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class CardGrid extends StatelessWidget {
  static const _cardsPerRow = 6;

  final Iterable<CardCopy> cards;
  final ScrollPhysics scrollPhysics;

  const CardGrid({
    required this.cards,
    this.scrollPhysics = const ClampingScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        shrinkWrap: true,
        physics: scrollPhysics,
        padding: const EdgeInsets.all(AppSizes.screenMarginSmall),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _cardsPerRow,
          mainAxisSpacing: AppSizes.deckBuilderGridSpacing,
          crossAxisSpacing: AppSizes.deckBuilderGridSpacing,
          childAspectRatio: AppSizes.yugiohCardAspectRatio,
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return _GridCard(
            cardCopy: cards.elementAt(index),
            index: index,
          );
        },
      ),
    );
  }
}

class _GridCard extends StatelessWidget {
  final CardCopy cardCopy;
  final int index;

  const _GridCard({
    required this.cardCopy,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckBuilderViewModel>(context);

    return GestureDetector(
      onTap: () => vm.onCardPressed(cardCopy, index),
      child: Hero(
        tag: vm.getCardTag(cardCopy, index),
        child: CardImage(
          card: cardCopy.card,
          image: cardCopy.image,
        ),
      ),
    );
  }
}
