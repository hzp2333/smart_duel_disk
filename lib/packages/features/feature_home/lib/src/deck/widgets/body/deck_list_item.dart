import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class DeckListItem extends StatelessWidget {
  final Color backgroundColor;
  final Widget image;
  final String deckName;
  final VoidCallback? onPressed;

  const DeckListItem({
    required this.backgroundColor,
    required this.image,
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
          Positioned.fill(child: image),
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
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyles.deckName,
            ),
          ),
          Positioned.fill(
            child: _DeckListItemRipple(
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

class _DeckListItemRipple extends StatelessWidget {
  final Color backgroundColor;
  final String deckName;
  final VoidCallback? onPressed;

  const _DeckListItemRipple({
    required this.backgroundColor,
    required this.deckName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        highlightColor: Colors.transparent,
        splashColor: backgroundColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppSizes.generalBorderRadius),
      ),
    );
  }
}
