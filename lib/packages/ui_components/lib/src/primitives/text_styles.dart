import 'package:flutter/material.dart';

import '../../ui_components.dart';

class TextStyles {
  static const subtitle = TextStyle(
    fontSize: TextSizes.subtitleSize,
    fontWeight: FontWeight.w600,
  );

  static const newsCardDate = TextStyle(
    fontSize: TextSizes.newsCardDateTextSize,
  );

  static const deckSectionTitle = TextStyle(
    fontSize: TextSizes.deckSectionTitle,
    fontWeight: FontWeight.w600,
  );

  static const deckSectionCardTitle = TextStyle(
    color: AppColors.primaryIconColor,
    fontWeight: FontWeight.w500,
  );

  static const cardDialogBigText = TextStyle(
    fontSize: TextSizes.cardDialogBigText,
  );
}
