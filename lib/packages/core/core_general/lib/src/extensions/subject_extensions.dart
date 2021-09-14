import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

extension SubjectExtensions on Subject {
  void safeAdd<T>(T newValue) {
    if (!isClosed) {
      add(newValue);
    } else {
      debugPrint('⚠️ Could not add new value to closed stream. (newValue: $newValue)');
    }
  }
}
