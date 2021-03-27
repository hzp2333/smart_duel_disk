import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppColors {
  static const primaryAccentColor = Color(0xffae43d7);
  static const primaryBackgroundColor = Color(0xff1f2125);
  static const primaryIconColor = Color(0xffe8eaed);

  static const cardBackgroundColor = Color(0xff32333a);
  static const cardHeaderBackgroundColor = Color(0xff28292e);
  static final cardSplashColor = const Color(0xff9e9e9e).withOpacity(0.1);

  static const tabSelectedColor = primaryAccentColor;
  static const tabUnselectedColor = Color(0xff9e9e9e);
  static const tabSplashColor = Color(0xff28292e);

  static final deckYugiBackgroundColor = Colors.red[700];
  static final deckKaibaBackgroundColor = Colors.blue[700];

  static final cardDialogAccent = Colors.greenAccent;
  static final cardDialogBackgroundColor = Colors.black.withOpacity(0.4);

  static final whiteOverlayGradient = LinearGradient(
    colors: [Colors.white.withOpacity(0.35), Colors.white.withOpacity(0)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final blackShadow = BoxShadow(
    color: Colors.black.withOpacity(0.5),
    blurRadius: 20.0,
    spreadRadius: 8,
    offset: const Offset(0, 4),
  );
}
