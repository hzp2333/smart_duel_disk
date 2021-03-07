import 'package:flutter/material.dart';

import 'dialog_config.dart';

abstract class DialogService {
  Future<bool> showAlertDialog(DialogConfig dialogConfig);
  Future<T> showCustomDialog<T>(Widget child);
}
