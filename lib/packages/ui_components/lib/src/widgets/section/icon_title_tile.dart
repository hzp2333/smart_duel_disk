import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class IconTitleTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const IconTitleTile({
    @required this.title,
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
                  title,
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
