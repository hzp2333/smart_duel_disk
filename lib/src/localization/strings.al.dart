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

  static const deckBuilderGeneralErrorDescription = PlainLocalizedString(
    key: 'deck_builder_general_error_description',
    values: {
      'en':
          '''An error occurred while fetching the cards. Please check your internet connection and try again.''',
    },
  );

  static const deckBuilderNoDataErrorDescription = PlainLocalizedString(
    key: 'deck_builder_no_data_error_description',
    values: {
      'en': '''No cards were found. Please update the filter.''',
    },
  );

  static const deckBuilderSearchHint = PlainLocalizedString(
    key: 'deck_builder_search_hint',
    values: {
      'en': '''Search by name or archetype...''',
    },
  );

  static const deckPreBuiltDecksTitle = PlainLocalizedString(
    key: 'deck_pre_built_decks_title',
    values: {
      'en': '''Pre-built decks''',
    },
  );

  static const deckPersonalDecksTitle = PlainLocalizedString(
    key: 'deck_personal_decks_title',
    values: {
      'en': '''Personal decks''',
    },
  );

  static const deckPreBuiltYugiTitle = PlainLocalizedString(
    key: 'deck_pre_built_yugi_title',
    values: {
      'en': '''Yugi's Deck''',
    },
  );

  static const deckPreBuiltKaibaTitle = PlainLocalizedString(
    key: 'deck_pre_built_kaiba_title',
    values: {
      'en': '''Kaiba's Deck''',
    },
  );

  static const featureNotAvailableYetDescription = ArgLocalizedString1(
    key: 'feature_not_available_yet_description',
    values: {
      'en': '''{1} is not available yet''',
    },
  );

  static const deckPersonalCreateDeck = PlainLocalizedString(
    key: 'deck_personal_create_deck',
    values: {
      'en': '''Create a deck''',
    },
  );

  static const deckPersonalSearchCard = PlainLocalizedString(
    key: 'deck_personal_search_card',
    values: {
      'en': '''Search a card''',
    },
  );

  static const speedDuelCardActionSummon = PlainLocalizedString(
    key: 'speed_duel_card_action_summon',
    values: {
      'en': '''Summon''',
    },
  );

  static const speedDuelCardActionActivate = PlainLocalizedString(
    key: 'speed_duel_card_action_activate',
    values: {
      'en': '''Activate''',
    },
  );

  static const speedDuelCardActionToAttack = PlainLocalizedString(
    key: 'speed_duel_card_action_to_attack',
    values: {
      'en': '''To ATK''',
    },
  );

  static const speedDuelCardActionToDefence = PlainLocalizedString(
    key: 'speed_duel_card_action_to_defence',
    values: {
      'en': '''To DEF''',
    },
  );

  static const speedDuelCardActionFlip = PlainLocalizedString(
    key: 'speed_duel_card_action_flip',
    values: {
      'en': '''Flip''',
    },
  );

  static const speedDuelCardActionSet = PlainLocalizedString(
    key: 'speed_duel_card_action_set',
    values: {
      'en': '''Set''',
    },
  );

  static const speedDuelCardActionDestroy = PlainLocalizedString(
    key: 'speed_duel_card_action_destroy',
    values: {
      'en': '''Destroy''',
    },
  );

  static const speedDuelCardActionSummonAttack = PlainLocalizedString(
    key: 'speed_duel_card_action_summon_attack',
    values: {
      'en': '''Summon ATK''',
    },
  );

  static const speedDuelCardActionSummonDefence = PlainLocalizedString(
    key: 'speed_duel_card_action_summon_defence',
    values: {
      'en': '''Summon DEF''',
    },
  );
}
