import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:smart_duel_disk/packages/core/core_config/core_config_interface/lib/core_config_interface.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/wrapper_crashlytics_interface/lib/wrapper_crashlytics_interface.dart';

import 'src/app/app_provider.dart';
import 'src/di/di.dart';

Future<void> start(AppConfig appConfig, Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await initDependencies(appConfig, environment);

  final crashlyticsProvider = di.get<CrashlyticsProvider>();

  // Catch Flutter specific errors and report them.
  FlutterError.onError = crashlyticsProvider.logFlutterException;

  // Catch all uncaught errors from the framework and report them.
  runZonedGuarded<Future<void>>(() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    setPathUrlStrategy();

    runApp(const SmartDuelDiskAppProvider());
  }, crashlyticsProvider.logException);
}
