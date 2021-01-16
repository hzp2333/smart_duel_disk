import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';

import '../../deck_viewmodel.dart';

class PersonalDecks extends StatelessWidget {
  const PersonalDecks();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckViewModel>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PersonalDeckCard(
          icon: Icons.add,
          text: Strings.deckPersonalCreateDeck.get(),
          onPressed: () => context.snackbar(
            Strings.featureNotAvailableYetDescription.get('Creating a personal deck'),
          ),
        ),
        const SizedBox(height: AppDimensions.deckPersonalCardSeparator),
        _PersonalDeckCard(
          icon: Icons.search,
          text: Strings.deckPersonalSearchCard.get(),
          onPressed: vm.onSearchCardPressed,
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
