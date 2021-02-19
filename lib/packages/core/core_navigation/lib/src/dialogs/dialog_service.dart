import 'dialog_config.dart';

abstract class DialogService {
  Future<bool> showAlertDialog(DialogConfig dialogConfig);
}
