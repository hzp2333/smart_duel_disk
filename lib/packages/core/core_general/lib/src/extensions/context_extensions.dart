import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

extension ContextExtensions on BuildContext {
  void snackbar(String text) {
    Scaffold.of(this).hideCurrentSnackBar();
    Scaffold.of(this).showSnackBar(SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: AppColors.primaryIconColor),
      ),
      backgroundColor: AppColors.cardBackgroundColor,
    ));
  }
}
