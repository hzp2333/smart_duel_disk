import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;
}
