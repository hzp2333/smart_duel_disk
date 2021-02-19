import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/packages/core/core_logger/core_logger_interface/lib/core_logger_interface.dart' as api;
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart';

@LazySingleton(as: api.Logger)
class LoggerImpl implements api.Logger {
  final Logger _logger;
  final Logger _simpleLogger;
  final MemoryOutput _memoryOutput;
  final CrashlyticsProvider _crashlyticsProvider;

  factory LoggerImpl(
    CrashlyticsProvider crashlyticsProvider,
    AppConfig appConfig,
  ) {
    final memoryOutput = MemoryOutput(
      bufferSize: 400,
      secondOutput: _FlutterOutput(),
    );

    final logger = Logger(
      output: memoryOutput,
      printer: PrettyPrinter(methodCount: 0),
      filter: _ConfigDependentLogFilter(
        loggingEnabled: appConfig.loggingEnabled,
      ),
    );

    final simpleLogger = Logger(
      output: memoryOutput,
      printer: _DefaultPrinter(),
      filter: _ConfigDependentLogFilter(
        loggingEnabled: appConfig.loggingEnabled,
      ),
    );

    return LoggerImpl._(
      logger,
      simpleLogger,
      memoryOutput,
      crashlyticsProvider,
    );
  }

  LoggerImpl._(
    this._logger,
    this._simpleLogger,
    this._memoryOutput,
    this._crashlyticsProvider,
  );

  ListQueue<OutputEvent> getBufferedOutput() {
    return _memoryOutput.buffer;
  }

  @override
  void print(String message) {
    _simpleLogger.v(message);
  }

  @override
  void verbose(String tag, String message) {
    _logger.v(formatMessage(tag, message));
  }

  @override
  void debug(String tag, String message) {
    _logger.d(formatMessage(tag, message));
  }

  @override
  void info(String tag, String message) {
    _logger.i(formatMessage(tag, message));
  }

  @override
  void warning(String tag, String message) {
    _logger.w(formatMessage(tag, message));
  }

  @override
  void error(String tag, String message, dynamic exception, StackTrace stackTrace) {
    _logger.e(formatMessage(tag, message), exception, stackTrace);
    _crashlyticsProvider.logException(exception, stackTrace);
  }

  String formatMessage(String tag, String message) {
    return '${DateTime.now().toIso8601String()}: $tag: $message';
  }
}

class _ConfigDependentLogFilter extends LogFilter {
  final bool loggingEnabled;

  _ConfigDependentLogFilter({
    this.loggingEnabled = false,
  });

  @override
  bool shouldLog(LogEvent event) => loggingEnabled;
}

class _DefaultPrinter extends LogPrinter {
  static const _messageMaxCharacters = 500;

  @override
  List<String> log(LogEvent event) {
    final message = event.message.toString();
    return [if (message.length > _messageMaxCharacters) message.substring(0, _messageMaxCharacters) else message];
  }
}

class _FlutterOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(debugPrint);
  }
}
