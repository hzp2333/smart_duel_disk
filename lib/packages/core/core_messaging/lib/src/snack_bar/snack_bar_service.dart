import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

abstract class SnackBarService {
  GlobalKey<ScaffoldMessengerState> get messengerKey;
  void showSnackBar(
    String message, {
    TextAlign textAlign = TextAlign.left,
    double fontSize = 14.0,
  });
  void hideSnackBar();
}

@LazySingleton(as: SnackBarService)
class SnackBarServiceImpl implements SnackBarService {
  final GlobalKey<ScaffoldMessengerState> _messengerKey;

  SnackBarServiceImpl() : _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  GlobalKey<ScaffoldMessengerState> get messengerKey => _messengerKey;

  @override
  void showSnackBar(
    String message, {
    TextAlign textAlign = TextAlign.left,
    double fontSize = 14.0,
  }) {
    hideSnackBar();
    _messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: textAlign,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
        backgroundColor: AppColors.cardBackgroundColor,
      ),
    );
  }

  @override
  void hideSnackBar() {
    _messengerKey.currentState?.hideCurrentSnackBar();
  }
}
