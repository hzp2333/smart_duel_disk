import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';

abstract class BaseViewModel {
  final Logger _logger;
  Logger get logger => _logger;

  BaseViewModel(
    this._logger,
  );

  @mustCallSuper
  FutureOr<void> dispose() {}
}
