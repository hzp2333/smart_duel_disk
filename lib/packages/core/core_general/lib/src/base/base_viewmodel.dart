import 'package:flutter/foundation.dart';

abstract class BaseViewModel {
  @mustCallSuper
  void dispose() {}
}
