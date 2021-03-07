import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/src/dialogs/dialog_config.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/src/dialogs/dialog_service.dart';
import 'package:smart_duel_disk/src/navigation/router.gr.dart';

@LazySingleton(as: DialogService)
class DialogServiceImpl implements DialogService {
  final AppRouter _router;

  DialogServiceImpl(
    this._router,
  );

  @override
  Future<bool> showAlertDialog(DialogConfig dialogConfig) {
    final ios = Platform.isIOS;
    final dialog = ios ? _createCupertinoDialog(dialogConfig) : _createMaterialDialog(dialogConfig);

    return showDialog<bool>(
      context: _router.navigatorKey.currentState.overlay.context,
      barrierDismissible: dialogConfig.isDismissable,
      useRootNavigator: true,
      builder: (_) {
        return WillPopScope(
          onWillPop: () => Future.value(dialogConfig.isDismissable),
          child: dialog,
        );
      },
    );
  }

  Widget _createMaterialDialog(DialogConfig dialogConfig) {
    return AlertDialog(
      title: Text(
        dialogConfig.title,
      ),
      content: Text(
        dialogConfig.description,
      ),
      actions: [
        if (dialogConfig.negativeButton != null) ...{
          TextButton(
            onPressed: () => _popDialog(false),
            child: Text(dialogConfig.negativeButton),
          ),
        },
        TextButton(
          onPressed: () => _popDialog(true),
          child: Text(dialogConfig.positiveButton),
        ),
      ],
    );
  }

  Widget _createCupertinoDialog(DialogConfig dialogConfig) {
    return CupertinoAlertDialog(
      title: Text(
        dialogConfig.title,
      ),
      content: Text(
        dialogConfig.description,
      ),
      actions: <Widget>[
        if (dialogConfig.negativeButton != null) ...{
          CupertinoDialogAction(
            onPressed: () => _popDialog(false),
            child: Text(dialogConfig.negativeButton),
          ),
        },
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => _popDialog(true),
          child: Text(dialogConfig.positiveButton),
        ),
      ],
    );
  }

  void _popDialog<T>(T result) {
    _router.navigatorKey.currentState.pop(result);
  }

  @override
  Future<T> showCustomDialog<T>(Widget child) {
    return showDialog<T>(
      context: _router.navigatorKey.currentState.overlay.context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (_) => child,
    );
  }
}
