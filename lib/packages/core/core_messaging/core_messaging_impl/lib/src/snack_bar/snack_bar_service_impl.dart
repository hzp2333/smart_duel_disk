import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/core_messaging_interface/lib/core_messaging_interface.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

@LazySingleton(as: SnackBarService)
class SnackBarServiceImpl implements SnackBarService {
  final GlobalKey<ScaffoldMessengerState> _messengerKey;

  SnackBarServiceImpl() : _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  GlobalKey<ScaffoldMessengerState> get messengerKey => _messengerKey;

  @override
  void showSnackBar(String message) {
    hideSnackBar();
    _messengerKey.currentState?.showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColors.cardBackgroundColor,
    ));
  }

  @override
  void hideSnackBar() {
    _messengerKey.currentState?.hideCurrentSnackBar();
  }
}
