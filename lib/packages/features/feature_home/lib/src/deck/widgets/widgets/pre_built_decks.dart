import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/deck/deck_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class PreBuiltDecks extends StatelessWidget with ProviderMixin {
  const PreBuiltDecks();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckViewModel>(context);
    final stringProvider = getStringProvider(context);

    final List<Widget> deckCards = vm
        .getPreBuiltDecks()
        .map(
          (deck) => Expanded(
            child: _PreBuiltDeckCard(
              backgroundColor: deck.backgroundColor,
              imageUrl: deck.imageUrl,
              deckName: stringProvider.getString(deck.titleId),
              onPressed: () => vm.onPreBuiltDeckPressed(deck),
            ),
          ),
        )
        .toList();

    const spacing = SizedBox(width: AppSizes.deckPrebBuiltCardSeparator);

    final deckCardsAndSpacings = deckCards.intersperse(spacing);

    return Row(
      children: [
        ...deckCardsAndSpacings,
      ],
    );
  }
}

class _PreBuiltDeckCard extends StatelessWidget {
  final Color backgroundColor;
  final String imageUrl;
  final String deckName;
  final VoidCallback? onPressed;

  const _PreBuiltDeckCard({
    required this.backgroundColor,
    required this.imageUrl,
    required this.deckName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(AppSizes.generalBorderRadius),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.whiteOverlayGradient,
                borderRadius: BorderRadius.circular(AppSizes.generalBorderRadius),
              ),
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fitHeight,
              alignment: Alignment.topCenter,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.deckPrebuiltTextPadding),
            decoration: BoxDecoration(
              boxShadow: [AppElevations.blackShadow],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppSizes.generalBorderRadius),
                bottomRight: Radius.circular(AppSizes.generalBorderRadius),
              ),
            ),
            child: AutoSizeText(
              deckName,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyles.subtitle,
            ),
          ),
          Positioned.fill(
            child: _PreBuiltDeckCardRipple(
              backgroundColor: backgroundColor,
              deckName: deckName,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}

class _PreBuiltDeckCardRipple extends StatelessWidget {
  final Color backgroundColor;
  final String deckName;
  final VoidCallback? onPressed;

  const _PreBuiltDeckCardRipple({
    required this.backgroundColor,
    required this.deckName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        highlightColor: Colors.transparent,
        splashColor: backgroundColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppSizes.generalBorderRadius),
      ),
    );
  }
}
