// Mocks generated by Mockito 5.0.15 from annotations
// in smart_duel_disk/test/testing/mocks/shared.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;
import 'dart:ui' as _i5;

import 'package:flutter/cupertino.dart' as _i4;
import 'package:flutter/material.dart' as _i15;
import 'package:mockito/mockito.dart' as _i1;
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart'
    as _i17;
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart'
    as _i2;
import 'package:smart_duel_disk/packages/core/core_logger/lib/src/logger.dart'
    as _i6;
import 'package:smart_duel_disk/packages/core/core_messaging/lib/src/snack_bar/snack_bar_service.dart'
    as _i14;
import 'package:smart_duel_disk/packages/core/core_navigation/lib/core_navigation.dart'
    as _i7;
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart'
    as _i8;
import 'package:smart_duel_disk/packages/core/core_storage/lib/core_storage.dart'
    as _i18;
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart'
    as _i13;
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/duel/mixins/duel_form_validators.dart'
    as _i12;
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/home/models/home_tab.dart'
    as _i20;
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/home/usecases/get_home_tabs_use_case.dart'
    as _i19;
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart'
    as _i9;
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart'
    as _i10;
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart'
    as _i11;
import 'package:smart_duel_disk/packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart'
    as _i16;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeYugiohCard_0 extends _i1.Fake implements _i2.YugiohCard {}

class _FakeStreamTransformer_1<S, T> extends _i1.Fake
    implements _i3.StreamTransformer<S, T> {}

class _FakeWidget_2 extends _i1.Fake implements _i4.Widget {
  @override
  String toString({_i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeGlobalKey_3<T extends _i4.State<_i4.StatefulWidget>> extends _i1.Fake
    implements _i4.GlobalKey<T> {}

class _FakeLocale_4 extends _i1.Fake implements _i5.Locale {}

/// A class which mocks [Logger].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogger extends _i1.Mock implements _i6.Logger {
  MockLogger() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void print(String? message) =>
      super.noSuchMethod(Invocation.method(#print, [message]),
          returnValueForMissingStub: null);
  @override
  void verbose(String? tag, String? message) =>
      super.noSuchMethod(Invocation.method(#verbose, [tag, message]),
          returnValueForMissingStub: null);
  @override
  void debug(String? tag, String? message) =>
      super.noSuchMethod(Invocation.method(#debug, [tag, message]),
          returnValueForMissingStub: null);
  @override
  void info(String? tag, String? message) =>
      super.noSuchMethod(Invocation.method(#info, [tag, message]),
          returnValueForMissingStub: null);
  @override
  void warning(String? tag, String? message) =>
      super.noSuchMethod(Invocation.method(#warning, [tag, message]),
          returnValueForMissingStub: null);
  @override
  void error(String? tag, String? message, dynamic exception,
          StackTrace? stackTrace) =>
      super.noSuchMethod(
          Invocation.method(#error, [tag, message, exception, stackTrace]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i7.DialogService {
  MockDialogService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool?> showAlertDialog(_i7.DialogConfig? dialogConfig) =>
      (super.noSuchMethod(Invocation.method(#showAlertDialog, [dialogConfig]),
          returnValue: Future<bool?>.value()) as _i3.Future<bool?>);
  @override
  void popDialog<T>(T? result) =>
      super.noSuchMethod(Invocation.method(#popDialog, [result]),
          returnValueForMissingStub: null);
  @override
  _i3.Future<T?> showCustomDialog<T>(_i4.Widget? child) =>
      (super.noSuchMethod(Invocation.method(#showCustomDialog, [child]),
          returnValue: Future<T?>.value()) as _i3.Future<T?>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AppRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppRouter extends _i1.Mock implements _i7.AppRouter {
  MockAppRouter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> closeScreen() =>
      (super.noSuchMethod(Invocation.method(#closeScreen, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<bool?> showDialog(_i7.DialogConfig? dialogConfig) =>
      (super.noSuchMethod(Invocation.method(#showDialog, [dialogConfig]),
          returnValue: Future<bool?>.value()) as _i3.Future<bool?>);
  @override
  _i3.Future<void> launchUrl(String? url) =>
      (super.noSuchMethod(Invocation.method(#launchUrl, [url]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showHome() =>
      (super.noSuchMethod(Invocation.method(#showHome, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showNewsDetails(
          String? newsItemId, String? newsItemAuthorId) =>
      (super.noSuchMethod(
          Invocation.method(#showNewsDetails, [newsItemId, newsItemAuthorId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showYoutube() =>
      (super.noSuchMethod(Invocation.method(#showYoutube, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showTwitter() =>
      (super.noSuchMethod(Invocation.method(#showTwitter, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showDiscord() =>
      (super.noSuchMethod(Invocation.method(#showDiscord, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showDeckBuilder({_i2.PreBuiltDeck? preBuiltDeck}) =>
      (super.noSuchMethod(
          Invocation.method(
              #showDeckBuilder, [], {#preBuiltDeck: preBuiltDeck}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showSpeedDuel(_i8.DuelRoom? duelRoom) =>
      (super.noSuchMethod(Invocation.method(#showSpeedDuel, [duelRoom]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<_i2.PreBuiltDeck?> showSelectDeckDialog() =>
      (super.noSuchMethod(Invocation.method(#showSelectDeckDialog, []),
              returnValue: Future<_i2.PreBuiltDeck?>.value())
          as _i3.Future<_i2.PreBuiltDeck?>);
  @override
  _i3.Future<void> showYugiohCardDetail(
          _i2.YugiohCard? yugiohCard, int? index) =>
      (super.noSuchMethod(
          Invocation.method(#showYugiohCardDetail, [yugiohCard, index]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showDrawCard(_i5.VoidCallback? cardDrawnCallback) =>
      (super.noSuchMethod(Invocation.method(#showDrawCard, [cardDrawnCallback]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<_i9.CardPosition?> showPlayCardDialog(_i10.PlayCard? playCard,
          {_i11.Zone? newZone, bool? showActions = false}) =>
      (super.noSuchMethod(
              Invocation.method(#showPlayCardDialog, [playCard],
                  {#newZone: newZone, #showActions: showActions}),
              returnValue: Future<_i9.CardPosition?>.value())
          as _i3.Future<_i9.CardPosition?>);
  @override
  _i3.Future<void> showDuelRoom(_i2.PreBuiltDeck? preBuiltDeck) =>
      (super.noSuchMethod(Invocation.method(#showDuelRoom, [preBuiltDeck]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> showUserSettings() =>
      (super.noSuchMethod(Invocation.method(#showUserSettings, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [DataManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataManager extends _i1.Mock implements _i2.DataManager {
  MockDataManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
  @override
  _i3.Future<Iterable<_i2.NewsItem>> getNewsItems() => (super.noSuchMethod(
          Invocation.method(#getNewsItems, []),
          returnValue: Future<Iterable<_i2.NewsItem>>.value(<_i2.NewsItem>[]))
      as _i3.Future<Iterable<_i2.NewsItem>>);
  @override
  _i3.Future<Iterable<_i2.YugiohCard>> getSpeedDuelCards() =>
      (super.noSuchMethod(Invocation.method(#getSpeedDuelCards, []),
              returnValue:
                  Future<Iterable<_i2.YugiohCard>>.value(<_i2.YugiohCard>[]))
          as _i3.Future<Iterable<_i2.YugiohCard>>);
  @override
  _i3.Future<_i2.YugiohCard> getSpeedDuelCard(int? cardId) =>
      (super.noSuchMethod(Invocation.method(#getSpeedDuelCard, [cardId]),
              returnValue: Future<_i2.YugiohCard>.value(_FakeYugiohCard_0()))
          as _i3.Future<_i2.YugiohCard>);
  @override
  _i3.Future<_i2.YugiohCard> getToken() =>
      (super.noSuchMethod(Invocation.method(#getToken, []),
              returnValue: Future<_i2.YugiohCard>.value(_FakeYugiohCard_0()))
          as _i3.Future<_i2.YugiohCard>);
  @override
  Iterable<_i2.PreBuiltDeck> getPreBuiltDecks() =>
      (super.noSuchMethod(Invocation.method(#getPreBuiltDecks, []),
          returnValue: <_i2.PreBuiltDeck>[]) as Iterable<_i2.PreBuiltDeck>);
  @override
  _i3.Future<Iterable<int>> getPreBuiltDeckCardIds(_i2.PreBuiltDeck? deck) =>
      (super.noSuchMethod(Invocation.method(#getPreBuiltDeckCardIds, [deck]),
              returnValue: Future<Iterable<int>>.value(<int>[]))
          as _i3.Future<Iterable<int>>);
  @override
  _i2.ConnectionInfo? getConnectionInfo({bool? forceLocalInfo = false}) =>
      (super.noSuchMethod(Invocation.method(
              #getConnectionInfo, [], {#forceLocalInfo: forceLocalInfo}))
          as _i2.ConnectionInfo?);
  @override
  _i3.Future<void> saveConnectionInfo(_i2.ConnectionInfo? connectionInfo) =>
      (super.noSuchMethod(
          Invocation.method(#saveConnectionInfo, [connectionInfo]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  bool useOnlineDuelRoom() =>
      (super.noSuchMethod(Invocation.method(#useOnlineDuelRoom, []),
          returnValue: false) as bool);
  @override
  _i3.Future<void> saveUseOnlineDuelRoom({bool? value}) => (super.noSuchMethod(
      Invocation.method(#saveUseOnlineDuelRoom, [], {#value: value}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  Iterable<_i2.DeckAction> getDeckActions() =>
      (super.noSuchMethod(Invocation.method(#getDeckActions, []),
          returnValue: <_i2.DeckAction>[]) as Iterable<_i2.DeckAction>);
  @override
  bool isDeveloperModeEnabled() =>
      (super.noSuchMethod(Invocation.method(#isDeveloperModeEnabled, []),
          returnValue: false) as bool);
  @override
  _i3.Future<void> saveDeveloperModeEnabled({bool? value}) =>
      (super.noSuchMethod(
          Invocation.method(#saveDeveloperModeEnabled, [], {#value: value}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}

/// A class which mocks [DuelFormValidators].
///
/// See the documentation for Mockito's code generation for more information.
class MockDuelFormValidators extends _i1.Mock
    implements _i12.DuelFormValidators {
  MockDuelFormValidators() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.StreamTransformer<String?, String?> get ipAddressValidator =>
      (super.noSuchMethod(Invocation.getter(#ipAddressValidator),
              returnValue: _FakeStreamTransformer_1<String?, String?>())
          as _i3.StreamTransformer<String?, String?>);
  @override
  _i3.StreamTransformer<String?, String?> get portValidator =>
      (super.noSuchMethod(Invocation.getter(#portValidator),
              returnValue: _FakeStreamTransformer_1<String?, String?>())
          as _i3.StreamTransformer<String?, String?>);
  @override
  bool isValidIpAddress(String? ipAddress) =>
      (super.noSuchMethod(Invocation.method(#isValidIpAddress, [ipAddress]),
          returnValue: false) as bool);
  @override
  bool isValidPort(String? port) =>
      (super.noSuchMethod(Invocation.method(#isValidPort, [port]),
          returnValue: false) as bool);
  @override
  String toString() => super.toString();
}

/// A class which mocks [DuelDialogProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockDuelDialogProvider extends _i1.Mock
    implements _i13.DuelDialogProvider {
  MockDuelDialogProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Widget createSelectDeckDialog() =>
      (super.noSuchMethod(Invocation.method(#createSelectDeckDialog, []),
          returnValue: _FakeWidget_2()) as _i4.Widget);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SnackBarService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSnackBarService extends _i1.Mock implements _i14.SnackBarService {
  MockSnackBarService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.GlobalKey<_i15.ScaffoldMessengerState> get messengerKey =>
      (super.noSuchMethod(Invocation.getter(#messengerKey),
              returnValue: _FakeGlobalKey_3<_i15.ScaffoldMessengerState>())
          as _i4.GlobalKey<_i15.ScaffoldMessengerState>);
  @override
  void showSnackBar(String? message) =>
      super.noSuchMethod(Invocation.method(#showSnackBar, [message]),
          returnValueForMissingStub: null);
  @override
  void hideSnackBar() =>
      super.noSuchMethod(Invocation.method(#hideSnackBar, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SharedPreferencesProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferencesProvider extends _i1.Mock
    implements _i16.SharedPreferencesProvider {
  MockSharedPreferencesProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool containsKey(String? key) =>
      (super.noSuchMethod(Invocation.method(#containsKey, [key]),
          returnValue: false) as bool);
  @override
  bool getBool(String? key, {bool? defaultValue = false}) =>
      (super.noSuchMethod(
          Invocation.method(#getBool, [key], {#defaultValue: defaultValue}),
          returnValue: false) as bool);
  @override
  int? getInt(String? key) =>
      (super.noSuchMethod(Invocation.method(#getInt, [key])) as int?);
  @override
  double? getDouble(String? key) =>
      (super.noSuchMethod(Invocation.method(#getDouble, [key])) as double?);
  @override
  String? getString(String? key) =>
      (super.noSuchMethod(Invocation.method(#getString, [key])) as String?);
  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(#getStringList, [key]))
          as List<String>?);
  @override
  _i3.Future<bool> setBool(String? key, {bool? value}) =>
      (super.noSuchMethod(Invocation.method(#setBool, [key], {#value: value}),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> setInt(String? key, int? value) =>
      (super.noSuchMethod(Invocation.method(#setInt, [key, value]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> setDouble(String? key, double? value) =>
      (super.noSuchMethod(Invocation.method(#setDouble, [key, value]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> setString(String? key, String? value) =>
      (super.noSuchMethod(Invocation.method(#setString, [key, value]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> setStringList(String? key, List<String>? value) =>
      (super.noSuchMethod(Invocation.method(#setStringList, [key, value]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> remove(String? key) =>
      (super.noSuchMethod(Invocation.method(#remove, [key]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> clear() => (super.noSuchMethod(Invocation.method(#clear, []),
      returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AppConfig].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockAppConfig extends _i1.Mock implements _i17.AppConfig {
  MockAppConfig() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get twitterUserId =>
      (super.noSuchMethod(Invocation.getter(#twitterUserId), returnValue: '')
          as String);
  @override
  bool get loggingEnabled => (super
          .noSuchMethod(Invocation.getter(#loggingEnabled), returnValue: false)
      as bool);
  @override
  List<_i5.Locale> get supportedLocales =>
      (super.noSuchMethod(Invocation.getter(#supportedLocales),
          returnValue: <_i5.Locale>[]) as List<_i5.Locale>);
  @override
  _i5.Locale get fallbackLocale =>
      (super.noSuchMethod(Invocation.getter(#fallbackLocale),
          returnValue: _FakeLocale_4()) as _i5.Locale);
  @override
  String get translationsPath =>
      (super.noSuchMethod(Invocation.getter(#translationsPath), returnValue: '')
          as String);
  @override
  String get smartDuelServerAddress =>
      (super.noSuchMethod(Invocation.getter(#smartDuelServerAddress),
          returnValue: '') as String);
  @override
  String get smartDuelServerPort =>
      (super.noSuchMethod(Invocation.getter(#smartDuelServerPort),
          returnValue: '') as String);
  @override
  String get ygoProDeckBaseUrl => (super
          .noSuchMethod(Invocation.getter(#ygoProDeckBaseUrl), returnValue: '')
      as String);
  @override
  int get ygoProDeckReceiveTimeout =>
      (super.noSuchMethod(Invocation.getter(#ygoProDeckReceiveTimeout),
          returnValue: 0) as int);
  @override
  int get ygoProDeckConnectTimeout =>
      (super.noSuchMethod(Invocation.getter(#ygoProDeckConnectTimeout),
          returnValue: 0) as int);
  @override
  String get twitterUrl =>
      (super.noSuchMethod(Invocation.getter(#twitterUrl), returnValue: '')
          as String);
  @override
  String get tweetUrl =>
      (super.noSuchMethod(Invocation.getter(#tweetUrl), returnValue: '')
          as String);
  @override
  String get youtubeUrl =>
      (super.noSuchMethod(Invocation.getter(#youtubeUrl), returnValue: '')
          as String);
  @override
  String get discordUrl =>
      (super.noSuchMethod(Invocation.getter(#discordUrl), returnValue: '')
          as String);
  @override
  String toString() => super.toString();
}

/// A class which mocks [DuelStorageProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockDuelStorageProvider extends _i1.Mock
    implements _i18.DuelStorageProvider {
  MockDuelStorageProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> saveConnectionInfo(
          _i18.ConnectionInfoModel? connectionInfo) =>
      (super.noSuchMethod(
          Invocation.method(#saveConnectionInfo, [connectionInfo]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  bool useOnlineDuelRoom() =>
      (super.noSuchMethod(Invocation.method(#useOnlineDuelRoom, []),
          returnValue: false) as bool);
  @override
  _i3.Future<void> saveUseOnlineDuelRoom({bool? value}) => (super.noSuchMethod(
      Invocation.method(#saveUseOnlineDuelRoom, [], {#value: value}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetHomeTabsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetHomeTabsUseCase extends _i1.Mock
    implements _i19.GetHomeTabsUseCase {
  MockGetHomeTabsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Iterable<_i20.HomeTab> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
          returnValue: <_i20.HomeTab>[]) as Iterable<_i20.HomeTab>);
  @override
  String toString() => super.toString();
}
