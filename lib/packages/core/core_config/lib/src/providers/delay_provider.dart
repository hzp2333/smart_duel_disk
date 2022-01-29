import 'dart:async';
import 'dart:ui';

import 'package:injectable/injectable.dart';

abstract class DelayProvider {
  Future<void> delay(Duration duration, [FutureOr<void> Function()? callback]);
  Timer timer(Duration duration, VoidCallback callback);
}

@LazySingleton(as: DelayProvider)
class DelayProviderImpl implements DelayProvider {
  @override
  Future<void> delay(Duration duration, [FutureOr<void> Function()? callback]) {
    return Future<void>.delayed(duration, callback);
  }

  @override
  Timer timer(Duration duration, VoidCallback callback) {
    return Timer(duration, callback);
  }
}
