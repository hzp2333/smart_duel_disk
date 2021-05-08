import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui_components.dart';

// ignore: avoid_classes_with_only_static_members
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

  static final onboardingAppTile = GoogleFonts.audiowide(
    fontSize: TextSizes.onboardingAppTitle,
    height: 1.15,
  );

  static const button = TextStyle(
    fontSize: TextSizes.button,
  );

  static final onboardingFineprint = TextStyle(
    color: AppColors.fineprintTextColor,
    fontSize: TextSizes.onboardingFineprint,
  );
}
