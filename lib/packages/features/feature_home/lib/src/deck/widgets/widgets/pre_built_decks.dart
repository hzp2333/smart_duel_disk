import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/deck/deck_viewmodel.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

class PreBuiltDecks extends StatelessWidget {
  static const _yugiImageUrl =
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/84dc13b7-a2e7-4b45-83ec-311e72e82900/ddzt2in-de8eafe5-72bd-43b8-828c-f7ecbb634e6e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvODRkYzEzYjctYTJlNy00YjQ1LTgzZWMtMzExZTcyZTgyOTAwXC9kZHp0MmluLWRlOGVhZmU1LTcyYmQtNDNiOC04MjhjLWY3ZWNiYjYzNGU2ZS5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.nPSgoHWVu3imeEyPLFBR1swCyy33DIdEjo4jOIR9VBQ';
  static const _kaibaImageUrl =
      'https://static.wikia.nocookie.net/yugioh/images/2/2e/SetoKaibaDSOD-DULI.png/revision/latest?cb=20190929175200';

  const PreBuiltDecks();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckViewModel>(context);

    return Row(
      children: [
        Expanded(
          child: _PreBuiltDeckCard(
            backgroundColor: AppColors.deckYugiBackgroundColor,
            imageUrl: _yugiImageUrl,
            deckName: Strings.deckPreBuiltYugiTitle.get(),
            onPressed: () => vm.onPreBuiltDeckPressed(PreBuiltDeck.yugi),
          ),
        ),
        const SizedBox(width: AppDimensions.deckPrebuiltCardSeparator),
        Expanded(
          child: _PreBuiltDeckCard(
            backgroundColor: AppColors.deckKaibaBackgroundColor,
            imageUrl: _kaibaImageUrl,
            deckName: Strings.deckPreBuiltKaibaTitle.get(),
            onPressed: () => vm.onPreBuiltDeckPressed(PreBuiltDeck.kaiba),
          ),
        ),
      ],
    );
  }
}

class _PreBuiltDeckCard extends StatelessWidget {
  final Color backgroundColor;
  final String imageUrl;
  final String deckName;
  final VoidCallback onPressed;

  const _PreBuiltDeckCard({
    @required this.backgroundColor,
    @required this.imageUrl,
    @required this.deckName,
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
                borderRadius: BorderRadius.circular(AppDimensions.generalBorderRadius),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.whiteOverlayGradient,
                borderRadius: BorderRadius.circular(AppDimensions.generalBorderRadius),
              ),
            ),
          ),
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fitHeight,
              alignment: Alignment.topCenter,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppDimensions.deckPrebuiltTextPadding),
            decoration: BoxDecoration(
              boxShadow: [AppColors.blackShadow],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppDimensions.generalBorderRadius),
                bottomRight: Radius.circular(AppDimensions.generalBorderRadius),
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
  final VoidCallback onPressed;

  const _PreBuiltDeckCardRipple({
    @required this.backgroundColor,
    @required this.deckName,
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
        borderRadius: BorderRadius.circular(AppDimensions.newsCardBorderRadius),
      ),
    );
  }
}
