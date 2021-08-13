import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

extension BuildContextExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;

  double get playCardHeight =>
      (screenHeight -
          safeAreaPadding.top -
          safeAreaPadding.bottom -
          AppSizes.duelFieldFirstSecondRowSpacing -
          AppSizes.duelFieldSecondHandRowSpacing -
          2 * AppSizes.screenMargin) /
      3;
}
