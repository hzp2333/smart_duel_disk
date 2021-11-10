import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

import '../../core_navigation.dart';
import 'entities/dialog_config.dart';

abstract class DialogService {
  Future<bool?> showAlertDialog(DialogConfig dialogConfig);
  void popDialog<T>(T result);
  Future<T?> showCustomDialog<T>(Widget child);
}

@LazySingleton(as: DialogService)
class DialogServiceImpl implements DialogService {
  final AutoRouteRouter _router;

  DialogServiceImpl(
    this._router,
  );

  @override
  Future<bool?> showAlertDialog(DialogConfig dialogConfig) {
    final cupertino = Platform.isIOS || Platform.isMacOS;
    final dialog = cupertino ? _createCupertinoDialog(dialogConfig) : _createMaterialDialog(dialogConfig);

    return showDialog<bool>(
      context: _router.navigatorKey.currentState!.overlay!.context,
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
        if (dialogConfig.negativeButtonText != null) ...{
          TextButton(
            onPressed: () => popDialog(false),
            child: Text(dialogConfig.negativeButtonText!),
          ),
        },
        TextButton(
          onPressed: () => popDialog(true),
          child: Text(dialogConfig.positiveButtonText),
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
        if (dialogConfig.negativeButtonText != null) ...{
          CupertinoDialogAction(
            onPressed: () => popDialog(false),
            child: Text(dialogConfig.negativeButtonText!),
          ),
        },
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => popDialog(true),
          child: Text(dialogConfig.positiveButtonText),
        ),
      ],
    );
  }

  @override
  void popDialog<T>(T result) {
    _router.navigatorKey.currentState!.pop(result);
  }

  @override
  Future<T?> showCustomDialog<T>(Widget child) {
    return showDialog<T>(
      context: _router.navigatorKey.currentState!.overlay!.context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (_) => child,
    );
  }
}
