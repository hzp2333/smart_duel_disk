import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class PreBuiltDecks extends StatelessWidget {
  static const _yugiImageUrl =
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/84dc13b7-a2e7-4b45-83ec-311e72e82900/ddzt2in-de8eafe5-72bd-43b8-828c-f7ecbb634e6e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvODRkYzEzYjctYTJlNy00YjQ1LTgzZWMtMzExZTcyZTgyOTAwXC9kZHp0MmluLWRlOGVhZmU1LTcyYmQtNDNiOC04MjhjLWY3ZWNiYjYzNGU2ZS5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.nPSgoHWVu3imeEyPLFBR1swCyy33DIdEjo4jOIR9VBQ';
  static const _kaibaImageUrl =
      'https://static.wikia.nocookie.net/yugioh/images/2/2e/SetoKaibaDSOD-DULI.png/revision/latest?cb=20190929175200';
  const PreBuiltDecks();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _PreBuiltDeckCard(
            backgroundColor: AppColors.deckYugiBackgroundColor,
            imageUrl: _yugiImageUrl,
            deckName: "Yugi's Deck",
          ),
        ),
        const SizedBox(width: AppDimensions.deckPrebuiltCardSeparator),
        Expanded(
          child: _PreBuiltDeckCard(
            backgroundColor: AppColors.deckKaibaBackgroundColor,
            imageUrl: _kaibaImageUrl,
            deckName: "Kaiba's Deck",
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

  const _PreBuiltDeckCard({
    @required this.backgroundColor,
    @required this.imageUrl,
    @required this.deckName,
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
            child: Image.network(
              imageUrl,
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

  const _PreBuiltDeckCardRipple({
    @required this.backgroundColor,
    @required this.deckName,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Scaffold.of(context).hideCurrentSnackBar();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              '$deckName is not available yet',
              style: const TextStyle(color: AppColors.primaryIconColor),
            ),
            backgroundColor: AppColors.cardBackgroundColor,
          ));
        },
        highlightColor: Colors.transparent,
        splashColor: backgroundColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppDimensions.newsCardBorderRadius),
      ),
    );
  }
}
