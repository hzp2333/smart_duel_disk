import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics_provider/wrapper_crashlytics_provider_interface/lib/wrapper_crashlytics_provider_interface.dart';
import 'package:smart_duel_disk/src/app/app.dart';
import 'package:smart_duel_disk/src/di/di.dart';

Future<void> start(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await initDependencies(appConfig);

  final crashlyticsProvider = di.get<CrashlyticsProvider>();

  // Catch Flutter specific errors and report them.
  FlutterError.onError = crashlyticsProvider.logFlutterException;

  // Catch all uncaught errors from the framework and report them.
  runZonedGuarded<Future<void>>(() async {
    runApp(SmartDuelDiskApp());
  }, crashlyticsProvider.logException);
}
