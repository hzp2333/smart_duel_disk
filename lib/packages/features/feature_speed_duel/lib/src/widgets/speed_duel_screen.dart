import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_event.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/widgets/body/draggable_card.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../speed_duel_viewmodel.dart';
import 'body/card_list_bottom_sheet.dart';
import 'body/card_zones/deck_zone.dart';
import 'body/card_zones/hand_zone.dart';
import 'body/card_zones/multi_card_field_zone.dart';
import 'body/card_zones/single_card_field_zone.dart';

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
    _speedDuelEventSubscription = vm.speedDuelScreenEvent.listen((speedDuelEvent) {
      speedDuelEvent.when(
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
    _bottomSheetController = _scaffoldKey.currentState.showBottomSheet((_) => CardListBottomSheet(zone: zone));
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
    if (vm.onWillPop()) {
      return Future.value(true);
    }

    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(const SnackBar(
      content: Text('Currently, the back key cannot be used.'),
    ));

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => _closeBottomSheet(),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: AppColors.primaryBackgroundColor,
          body: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.screenMargin),
          child: _SpeedDuelStateBuilder(),
        ),
      ),
    );
  }
}

class _SpeedDuelStateBuilder extends HookWidget {
  const _SpeedDuelStateBuilder();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);
    final speedDuelState = useStream(vm.speedDuelState, initialData: const SpeedDuelLoading());

    return speedDuelState.data.when(
      (playerState) => _PlayerField(playerState: playerState),
      loading: () => const GeneralLoadingState(),
      error: () => const GeneralErrorState(description: 'An error occurred while starting the speed duel'),
    );
  }
}

class _PlayerField extends StatelessWidget {
  final PlayerState playerState;

  const _PlayerField({
    @required this.playerState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: _FirstPlayerFieldRow(playerState: playerState),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: _SecondPlayerFieldRow(playerState: playerState),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: HandZone(zone: playerState.hand),
        ),
      ],
    );
  }
}

class _FirstPlayerFieldRow extends StatelessWidget {
  final PlayerState playerState;

  const _FirstPlayerFieldRow({
    @required this.playerState,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _ZoneFiller(),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            SingleCardFieldZone(zone: playerState.fieldZone),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleCardFieldZone(zone: playerState.mainMonsterZone1),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            SingleCardFieldZone(zone: playerState.mainMonsterZone2),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            SingleCardFieldZone(zone: playerState.mainMonsterZone3),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MultiCardFieldZone(
              zone: playerState.graveyardZone,
              showCardBack: false,
            ),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            MultiCardFieldZone(
              zone: playerState.banishedZone,
              showCardBack: false,
            ),
          ],
        ),
      ],
    );
  }
}

class _SecondPlayerFieldRow extends StatelessWidget {
  final PlayerState playerState;

  const _SecondPlayerFieldRow({
    @required this.playerState,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _ZoneFiller(),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            MultiCardFieldZone(
              zone: playerState.extraDeckZone,
              showCardBack: true,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleCardFieldZone(zone: playerState.spellTrapZone1),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            SingleCardFieldZone(zone: playerState.spellTrapZone2),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            SingleCardFieldZone(zone: playerState.spellTrapZone3),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DeckZone(
              zone: playerState.deckZone,
              showCardBack: true,
            ),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            const AspectRatio(
              aspectRatio: AppDimensions.yugiohCardAspectRatio,
              child: SizedBox.expand(),
            ),
          ],
        ),
      ],
    );
  }
}

class _ZoneFiller extends StatelessWidget {
  const _ZoneFiller();

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: AppDimensions.yugiohCardAspectRatio,
      child: SizedBox.expand(),
    );
  }
}
