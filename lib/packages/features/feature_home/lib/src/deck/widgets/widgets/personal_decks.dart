import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class PersonalDecks extends StatelessWidget {
  const PersonalDecks();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _PersonalDeckCard(
          icon: Icons.search,
          text: 'Search a card',
        ),
        SizedBox(height: AppDimensions.deckPersonalCardSeparator),
        _PersonalDeckCard(
          icon: Icons.add,
          text: 'Create a deck',
        ),
      ],
    );
  }
}

class _PersonalDeckCard extends StatelessWidget {
  final String text;
  final IconData icon;

  const _PersonalDeckCard({
    @required this.text,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackgroundColor,
      margin: EdgeInsets.zero,
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
    );
  }
}
