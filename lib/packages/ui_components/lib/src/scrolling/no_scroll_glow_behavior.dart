import 'package:flutter/material.dart';

class NoScrollGlowBehavior extends ScrollBehavior {
  const NoScrollGlowBehavior();

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
