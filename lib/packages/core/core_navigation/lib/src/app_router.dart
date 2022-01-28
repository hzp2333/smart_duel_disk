import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_config/lib/core_config.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_smart_duel_server/lib/core_smart_duel_server.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/feature_home.dart';
import 'package:smart_duel_disk/packages/features/feature_onboarding/lib/src/sign_in/sign_in_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/feature_speed_duel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/declare_phase_dialog/models/declare_phase_dialog_parameters.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_url_launcher/lib/wrapper_url_launcher.dart';

import '../core_navigation.dart';

abstract class AppRouter {
  Future<void> closeScreen();
  Future<bool?> showDialog(DialogConfig dialogConfig);
  Future<void> launchUrl(String url);

  Future<void> showOnboarding();
  Future<void> showSignIn({SignInCallback? onSignedIn});
  Future<void> showHome();
  Future<void> showNewsDetails(String? newsItemId, String? newsItemAuthorId);
  Future<void> showYoutube();
  Future<void> showTwitter();
  Future<void> showDiscord();
  Future<void> showDeckBuilder({PreBuiltDeck? preBuiltDeck});
  Future<void> showYugiohCardDetail(CardCopy cardCopy, String tag);
  Future<void> showSpeedDuel(DuelRoom duelRoom);
  Future<PreBuiltDeck?> showSelectDeckDialog();
  Future<void> showDrawCard(VoidCallback cardDrawnCallback);
  Future<PlayCardDialogResult?> showPlayCardDialog(PlayCard playCard, {Zone? newZone, bool showActions = false});
  Future<AddCardToDeckDialogResult?> showAddCardToDeckDialog(PlayCard playCard);
  Future<DeclarePhaseDialogResult?> showDeclarePhaseDialog(DuelPhaseType duelPhaseType);
  Future<void> showDuelRoom(PreBuiltDeck preBuiltDeck);
  Future<void> showUserSettings();
  Future<double?> showLifepointsCalculator({required double initialValue});
}

@LazySingleton(as: AppRouter)
class AppRouterImpl implements AppRouter {
  final AppConfig _appConfig;
  final AutoRouteRouter _router;
  final DialogService _dialogService;
  final UrlLauncherProvider _urlLauncherProvider;
  final DuelDialogProvider _duelDialogProvider;
  final SpeedDuelDialogProvider _speedDuelDialogProvider;

  AppRouterImpl(
    this._appConfig,
    this._router,
    this._dialogService,
    this._urlLauncherProvider,
    this._duelDialogProvider,
    this._speedDuelDialogProvider,
  );

  bool popUntilRootPredicate(Route<dynamic> route) => false;

  @override
  Future<void> closeScreen() {
    return _router.pop();
  }

  @override
  Future<bool?> showDialog(DialogConfig dialogConfig) {
    return _dialogService.showAlertDialog(dialogConfig);
  }

  @override
  Future<void> launchUrl(String url) async {
    await _urlLauncherProvider.launchUrl(url);
  }

  //region Onboarding

  @override
  Future<void> showOnboarding() {
    return _router.pushAndPopUntil(const OnboardingRoute(), predicate: popUntilRootPredicate);
  }

  @override
  Future<void> showSignIn({SignInCallback? onSignedIn}) {
    return _router.pushAndPopUntil(SignInRoute(onSignedIn: onSignedIn), predicate: popUntilRootPredicate);
  }

  //endregion

  //region Home

  @override
  Future<void> showHome() {
    return _router.pushAndPopUntil(const HomeRoute(), predicate: popUntilRootPredicate);
  }

  //endregion

  //region News

  // TODO: catch exceptions in viewmodel, and use logger instead of debugPrint
  @override
  Future<void> showNewsDetails(String? newsItemId, String? newsItemAuthorId) async {
    try {
      final url = _appConfig.tweetUrl.replaceAll('{0}', newsItemAuthorId!).replaceAll('{1}', newsItemId!);
      await _urlLauncherProvider.launchUrl(url);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  @override
  Future<void> showYoutube() async {
    try {
      await _urlLauncherProvider.launchUrl(_appConfig.youtubeUrl);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  @override
  Future<void> showTwitter() async {
    try {
      await _urlLauncherProvider.launchUrl(_appConfig.twitterUrl);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  @override
  Future<void> showDiscord() async {
    try {
      await _urlLauncherProvider.launchUrl(_appConfig.discordUrl);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  //endregion

  //region Deck

  @override
  Future<void> showDeckBuilder({PreBuiltDeck? preBuiltDeck}) {
    return _router.navigate(DeckBuilderRoute(preBuiltDeck: preBuiltDeck));
  }

  //endregion

  //region Duel

  @override
  Future<void> showSpeedDuel(DuelRoom duelRoom) {
    return _router.replace(SpeedDuelRoute(duelRoom: duelRoom));
  }

  @override
  Future<PreBuiltDeck?> showSelectDeckDialog() {
    final selectDeckDialog = _duelDialogProvider.createSelectDeckDialog();
    return _dialogService.showCustomDialog(selectDeckDialog);
  }

  //endregion

  //region Deck builder

  @override
  Future<void> showYugiohCardDetail(CardCopy cardCopy, String tag) {
    return _router.navigate(YugiohCardDetailRoute(cardCopy: cardCopy, tag: tag));
  }

  //endregion

  //region Speed Duel

  @override
  Future<void> showDrawCard(VoidCallback cardDrawnCallback) {
    return _router.navigate(DrawCardRoute(cardDrawnCallback: cardDrawnCallback));
  }

  @override
  Future<PlayCardDialogResult?> showPlayCardDialog(PlayCard playCard, {Zone? newZone, bool showActions = false}) {
    final parameters = PlayCardDialogParameters(
      playCard: playCard,
      newZone: newZone,
      showActions: showActions,
    );

    final playCardDialog = _speedDuelDialogProvider.createPlayCardDialog(parameters);
    return _dialogService.showCustomDialog<PlayCardDialogResult>(playCardDialog);
  }

  @override
  Future<AddCardToDeckDialogResult?> showAddCardToDeckDialog(PlayCard playCard) {
    final addCardToDeckDialog = _speedDuelDialogProvider.createAddCardToDeckDialog(playCard);
    return _dialogService.showCustomDialog<AddCardToDeckDialogResult>(addCardToDeckDialog);
  }

  @override
  Future<DeclarePhaseDialogResult?> showDeclarePhaseDialog(DuelPhaseType duelPhaseType) {
    final parameters = DeclarePhaseDialogParameters(currentDuelPhaseType: duelPhaseType);
    final declarePhaseDialog = _speedDuelDialogProvider.createDeclarePhaseDialog(parameters);
    return _dialogService.showCustomDialog<DeclarePhaseDialogResult>(declarePhaseDialog);
  }

  //endregion

  //region Duel Room

  @override
  Future<void> showDuelRoom(PreBuiltDeck preBuiltDeck) {
    return _router.navigate(DuelRoomRoute(preBuiltDeck: preBuiltDeck));
  }

  //endregion

  //region User Settings

  @override
  Future<void> showUserSettings() {
    return _router.navigate(const UserSettingsRoute());
  }

  //endregion

  @override
  Future<double?> showLifepointsCalculator({required double initialValue}) {
    final calculatorScreen = CalculatorProvider(initialValue: initialValue);
    return _dialogService.showModal<double>(calculatorScreen);
  }
}
