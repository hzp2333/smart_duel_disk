import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class CardGrid extends StatelessWidget {
  static const _cardsPerRow = 6;

  final Iterable<YugiohCard> cards;
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
            card: cards.elementAt(index),
            index: index,
          );
        },
      ),
    );
  }
}

class _GridCard extends StatelessWidget {
  final YugiohCard card;
  final int index;

  const _GridCard({
    required this.card,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckBuilderViewModel>(context);

    final cardBackPath = Assets.illustrations.cardBack.path;

    return GestureDetector(
      onTap: () => vm.onCardPressed(card, index),
      child: Hero(
        tag: '${card.id} - $index',
        child: CachedNetworkImage(
          imageUrl: kIsWeb ? card.imageLargeUrl : card.imageSmallUrl,
          fit: BoxFit.fitWidth,
          placeholder: (_, __) => ImagePlaceholder(imageAssetId: cardBackPath),
          // ignore: avoid_annotating_with_dynamic
          errorWidget: (_, __, dynamic ___) => ImagePlaceholder(imageAssetId: cardBackPath),
        ),
      ),
    );
  }
}
