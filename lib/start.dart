import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/codegen_loader.g.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_display_config/lib/core_display_config.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_crashlytics/lib/wrapper_crashlytics.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_remote_config/lib/wrapper_remote_config.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/app/app_provider.dart';
import 'src/di/di.dart';

Future<void> start(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  await _initDependencies(environment);

  final crashlyticsProvider = di.get<CrashlyticsProvider>();

  // Catch Flutter specific errors and report them.
  FlutterError.onError = crashlyticsProvider.logFlutterException;

  // Catch all uncaught errors from the framework and report them.
  await runZonedGuarded<Future<void>>(
    () async {
      setPathUrlStrategy();

      final remoteConfigProvider = di.get<RemoteConfigProvider>();
      await remoteConfigProvider.init();

      final displayConfigService = di.get<DisplayConfigService>();
      await displayConfigService.useDefaultMode();

      final appConfig = di.get<AppConfig>();

      runApp(
        EasyLocalization(
          supportedLocales: appConfig.supportedLocales,
          fallbackLocale: appConfig.fallbackLocale,
          path: appConfig.translationsPath,
          saveLocale: false,
          assetLoader: di.get<CodegenLoader>(),
          child: const SmartDuelDiskAppProvider(),
        ),
      );
    },
    crashlyticsProvider.logException,
  );
}

const _secretsFilePath = './secrets.env';

Future<void> _initDependencies(Environment environment) async {
  late AppConfig appConfig;

  try {
    final dotEnv = DotEnv();
    await dotEnv.load(fileName: _secretsFilePath);
    appConfig = AppConfig.release(dotEnv);
  } catch (e) {
    appConfig = AppConfig.develop();
  }

  await initDependencies(appConfig, environment);
}
