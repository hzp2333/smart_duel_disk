import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class ClipboardProvider {
  void copyToClipboard(String text);
}

@LazySingleton(as: ClipboardProvider)
class ClipboardProviderImpl implements ClipboardProvider {
  @override
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
