import 'package:auto_localized/auto_localized.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/core/core_messaging/core_messaging_interface/lib/core_messaging_interface.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/di/di.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';
import 'package:smart_duel_disk/src/navigation/router.gr.dart';

class SmartDuelDiskApp extends StatelessWidget {
  const SmartDuelDiskApp();

  @override
  Widget build(BuildContext context) {
    final router = di.get<AppRouter>();
    final snackBarService = di.get<SnackBarService>();

    return AutoLocalizedApp(
      child: KeyboardDismisser(
        child: MaterialApp.router(
          title: 'Smart Duel Disk',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.primaryAccentColor,
              selectionColor: AppColors.primaryAccentColor,
              selectionHandleColor: AppColors.primaryAccentColor,
            ),
          ),
          scaffoldMessengerKey: snackBarService.messengerKey,
          routerDelegate: router.delegate(),
          routeInformationParser: router.defaultRouteParser(),
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationsDelegates,
        ),
      ),
    );
  }
}
