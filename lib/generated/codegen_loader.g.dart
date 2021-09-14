// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "deck_builder_general_error_description": "An error occurred while fetching the cards. Please check your internet connection and try again.",
  "deck_builder_no_data_error_description": "No cards were found. Please update the filter.",
  "deck_builder_search_hint": "Search by name or archetype...",
  "deck_personal_create_deck": "Create a deck",
  "deck_personal_decks_title": "Personal decks",
  "deck_personal_search_card": "Search a card",
  "deck_pre_built_decks_title": "Pre-built decks",
  "deck_pre_built_kaiba_title": "Kaiba's Deck",
  "deck_pre_built_mai_title": "Mai's Deck",
  "deck_pre_built_yugi_title": "Yugi's Deck",
  "feature_not_available_yet_description": "{} is not available yet",
  "general_error_try_again": "Try again",
  "home_tab_deck": "Deck",
  "home_tab_duel": "Duel",
  "home_tab_news": "News",
  "news_general_error_description": "The latest news could not be loaded. Please check your internet connection and try again.",
  "onboarding_app_title": "Smart\nDuel Disk",
  "onboarding_fineprint": "Smart Duel Disk is an unofficial Fan Project and is not approved or endorsed by Konami. Portions of the materials used are property of Konami Digital Entertainment.",
  "onboarding_initiate_link": "Initiate link!",
  "speed_duel_card_action_activate": "Activate",
  "speed_duel_card_action_destroy": "Destroy",
  "speed_duel_card_action_flip": "Flip",
  "speed_duel_card_action_set": "Set",
  "speed_duel_card_action_summon": "Summon",
  "speed_duel_card_action_summon_attack": "Summon ATK",
  "speed_duel_card_action_summon_defence": "Summon DEF",
  "speed_duel_card_action_to_attack": "To ATK",
  "speed_duel_card_action_to_defence": "To DEF"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
