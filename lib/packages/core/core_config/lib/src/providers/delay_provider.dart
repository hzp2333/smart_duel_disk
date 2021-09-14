import 'dart:async';

import 'package:injectable/injectable.dart';

abstract class DelayProvider {
  Future<void> delay(Duration duration, [FutureOr<void> Function()? callback]);
}

@LazySingleton(as: DelayProvider)
class DelayProviderImpl implements DelayProvider {
  @override
  Future<void> delay(Duration duration, [FutureOr<void> Function()? callback]) {
    return Future<void>.delayed(duration, callback);
  }
}
