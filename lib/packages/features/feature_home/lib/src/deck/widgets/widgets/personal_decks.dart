import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class PersonalDecks extends StatelessWidget {
  const PersonalDecks();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PersonalDeckCard(
          icon: Icons.add,
          text: 'Create a deck',
          onPressed: () {
            Scaffold.of(context).hideCurrentSnackBar();
            Scaffold.of(context).showSnackBar(const SnackBar(
              content: Text(
                'Creating a personal deck is not available yet',
                style: TextStyle(color: AppColors.primaryIconColor),
              ),
              backgroundColor: AppColors.cardBackgroundColor,
            ));
          },
        ),
        const SizedBox(height: AppDimensions.deckPersonalCardSeparator),
        _PersonalDeckCard(
          icon: Icons.search,
          text: 'Search a card',
          onPressed: () {},
        ),
      ],
    );
  }
}

class _PersonalDeckCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const _PersonalDeckCard({
    @required this.text,
    @required this.icon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackgroundColor,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onPressed,
        highlightColor: Colors.transparent,
        splashColor: AppColors.cardSplashColor,
        borderRadius: BorderRadius.circular(AppDimensions.newsCardBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.deckPersonalCardPadding),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.primaryIconColor,
              ),
              const SizedBox(width: AppDimensions.iconTitleSpacing),
              Expanded(
                child: Text(
                  text,
                  style: TextStyles.deckSectionCardTitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
