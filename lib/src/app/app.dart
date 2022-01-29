import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/lib/core_messaging.dart';
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/di/di.dart';

class SmartDuelDiskApp extends StatefulWidget {
  const SmartDuelDiskApp();

  @override
  State<SmartDuelDiskApp> createState() => _SmartDuelDiskAppState();
}

class _SmartDuelDiskAppState extends State<SmartDuelDiskApp> {
  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = di.get<AutoRouteRouter>();
    final snackBarService = di.get<SnackBarService>();

    return KeyboardDismisser(
      child: MaterialApp.router(
        title: 'Smart Duel Disk',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: AppColors.primaryBackgroundColor,
          canvasColor: AppColors.primaryBackgroundColor,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.primaryAccentColor,
            selectionColor: AppColors.primaryAccentColor,
            selectionHandleColor: AppColors.primaryAccentColor,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.all(AppSizes.screenMargin),
            border: OutlineInputBorder(),
          ),
        ),
        scaffoldMessengerKey: snackBarService.messengerKey,
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
