import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_event.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../speed_duel_viewmodel.dart';
import 'body/card_list_bottom_sheet.dart';
import 'body/speed_duel_field.dart';

class SpeedDuelScreen extends StatefulWidget {
  const SpeedDuelScreen();

  @override
  _SpeedDuelScreenState createState() => _SpeedDuelScreenState();
}

class _SpeedDuelScreenState extends State<SpeedDuelScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  StreamSubscription<SpeedDuelScreenEvent> _speedDuelEventSubscription;
  PersistentBottomSheetController<void> _bottomSheetController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    // Make the app full screen.
    SystemChrome.setEnabledSystemUIOverlays([]);

    final vm = Provider.of<SpeedDuelViewModel>(context, listen: false);
    vm.init();

    _speedDuelEventSubscription = vm.screenEvent.listen((event) {
      event.when(
        hideOverlays: () => _hideOverlays(),
        inspectCardPile: (zone) => _onInspectCardPileEventReceived(zone),
      );
    });
  }

  @override
  void dispose() {
    _speedDuelEventSubscription?.cancel();
    _speedDuelEventSubscription = null;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Show the status bar and bottom bar again.
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ]);

    super.dispose();
  }

  void _hideOverlays() {
    _closeBottomSheet();
  }

  void _onInspectCardPileEventReceived(Zone zone) {
    _closeBottomSheet();
    _bottomSheetController = _scaffoldKey.currentState.showBottomSheet(
      (_) => CardListBottomSheet(zone: zone),
      backgroundColor: AppColors.cardBackgroundColor,
    );
  }

  void _closeBottomSheet() {
    if (_bottomSheetController == null) {
      return;
    }

    try {
      _bottomSheetController.close();
    } finally {
      _bottomSheetController = null;
    }
  }

  Future<bool> _onWillPop() {
    if (_bottomSheetController != null) {
      _closeBottomSheet();
      return Future.value(false);
    }

    final vm = Provider.of<SpeedDuelViewModel>(context, listen: false);
    return Future.value(vm.onBackPressed());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => _closeBottomSheet(),
        child: ScrollConfiguration(
          behavior: const NoScrollGlowBehavior(),
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: AppColors.primaryBackgroundColor,
            body: const _BodyBuilder(),
          ),
        ),
      ),
    );
  }
}

class _BodyBuilder extends HookWidget {
  const _BodyBuilder();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);
    final speedDuelState = useStream(vm.screenState, initialData: const SpeedDuelLoading());

    return SafeArea(
      child: speedDuelState.data.when(
        (state) => SpeedDuelField(state: state),
        loading: () => const GeneralLoadingState(),
        error: () => const GeneralErrorState(description: 'An error occurred while starting the speed duel'),
      ),
    );
  }
}
