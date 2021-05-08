import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarOverrider extends StatelessWidget {
  final Widget child;
  final bool darkStyle;

  const StatusBarOverrider({
    @required this.child,
    this.darkStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkStyle ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: child,
    );
  }
}
