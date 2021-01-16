import 'package:flutter/material.dart';

class KeyboardDismisser extends StatelessWidget {
  final Widget child;

  const KeyboardDismisser({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = WidgetsBinding.instance.focusManager.primaryFocus;
        if (currentFocus != null) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }
}
