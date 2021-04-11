import 'package:flutter/material.dart';

import 'dialog_config.dart';

abstract class DialogService {
  Future<bool> showAlertDialog(DialogConfig dialogConfig);
  void popDialog<T>(T result);
  Future<T> showCustomDialog<T>(Widget child);
}
