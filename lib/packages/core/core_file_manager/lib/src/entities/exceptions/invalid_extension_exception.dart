import 'package:flutter/foundation.dart';

@immutable
class InvalidExtensionException implements Exception {
  const InvalidExtensionException();

  @override
  String toString() => 'The selected file does not have a valid extension.';
}
