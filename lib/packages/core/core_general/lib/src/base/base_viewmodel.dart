import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart';

abstract class BaseViewModel {
  final Logger _logger;
  Logger get logger => _logger;

  BaseViewModel(
    this._logger,
  );

  @mustCallSuper
  void dispose() {}
}
