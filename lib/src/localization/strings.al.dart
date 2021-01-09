// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_const, constant_identifier_names

// **************************************************************************
// AutoLocalizedGenerator
// **************************************************************************

import 'package:auto_localized/auto_localized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

@immutable
class AutoLocalizedData {
  static const supportedLocales = <Locale>[
    Locale('en'),
  ];

  static const delegate = AutoLocalizationDelegate(supportedLocales);

  static const localizationsDelegates = [
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    delegate,
  ];
}

extension AutoLocalizedContextExtension on BuildContext {
  List<Locale> get supportedLocales => AutoLocalizedData.supportedLocales;

  List<LocalizationsDelegate> get localizationsDelegates =>
      AutoLocalizedData.localizationsDelegates;

  String translate(
    LocalizedString string, [
    String arg1 = "",
    String arg2 = "",
    String arg3 = "",
    String arg4 = "",
    String arg5 = "",
  ]) =>
      string.when(
        plain: (string) => string.get(this),
        arg1: (string) => string.get(arg1, this),
        arg2: (string) => string.get(arg1, arg2, this),
        arg3: (string) => string.get(arg1, arg2, arg3, this),
        arg4: (string) => string.get(arg1, arg2, arg3, arg4, this),
        arg5: (string) => string.get(arg1, arg2, arg3, arg4, arg5, this),
      );
}

@immutable
class Strings {
  static const homeTabNews = PlainLocalizedString(
    key: 'home_tab_news',
    values: {
      'en': '''News''',
    },
  );

  static const homeTabDuel = PlainLocalizedString(
    key: 'home_tab_duel',
    values: {
      'en': '''Duel''',
    },
  );

  static const homeTabDeck = PlainLocalizedString(
    key: 'home_tab_deck',
    values: {
      'en': '''Deck''',
    },
  );

  static const generalErrorTryAgain = PlainLocalizedString(
    key: 'general_error_try_again',
    values: {
      'en': '''Try again''',
    },
  );

  static const newsGeneralErrorDescription = PlainLocalizedString(
    key: 'news_general_error_description',
    values: {
      'en':
          '''The latest news could not be loaded. Please check your internet connection and try again.''',
    },
  );
}
