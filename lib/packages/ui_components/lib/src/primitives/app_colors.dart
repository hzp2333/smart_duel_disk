import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppColors {
  static const primaryIconColor = Color(0xffe8eaed);

  static const primaryBackgroundColor = Color(0xff1f2125);
  static const secondaryBackgroundColor = Color(0xff171716);

  static const cardBackgroundColor = Color(0xff32333a);
  static const cardHeaderBackgroundColor = Color(0xff28292e);
  static final cardSplashColor = const Color(0xff9e9e9e).withOpacity(0.1);

  static const tabSelectedColor = primaryAccentColor;
  static const tabUnselectedColor = Color(0xff9e9e9e);
  static const tabSplashColor = Color(0xff28292e);

  static const deckTestBackgroundColor = primaryAccentColor;
  static const deckKaibaBackgroundColor = Color(0xff1976d2);
  static const deckMaiBackgroundColor = Color(0xfffdd835);
  static const deckYugiBackgroundColor = Color(0xffd32f2f);

  static final cardDialogAccent = Colors.greenAccent;
  static final cardDialogBackgroundColor = Colors.black.withOpacity(0.4);

  static const primaryAccentColor = Color(0xffae43d7);
  static const primaryLogoColor = Color(0xffcb35ef);
  static const secondaryLogoColor = Color(0xff6c1981);

  static const cardAnimationAttack = Color(0xffff5252);
  static const cardAnimationDeclare = Color(0xffffff00);
  static const zoneAnimationShuffle = Color(0xff448aff);

  static final whiteOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white.withOpacity(0.35),
      Colors.white.withOpacity(0),
    ],
  );

  static const onboardingBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.primaryBackgroundColor,
      AppColors.secondaryBackgroundColor,
    ],
    stops: [0, 0.5],
  );
}
