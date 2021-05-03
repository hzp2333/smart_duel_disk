import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_screen_event.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/speed_duel_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';

import '../speed_duel_viewmodel.dart';
import 'body/card_list_bottom_sheet.dart';
import 'body/speed_duel_field_rows.dart';

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
            body: const _Body(),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);

    return Stack(
      children: [
        // TODO: add playmat support
        // Positioned.fill(
        //   child: ImageAssetProvider(
        //     assetName: assetsProvider.speedDuelFieldBackground,
        //     fit: BoxFit.fill,
        //   ),
        // ),
        // Positioned.fill(
        //   child: Container(
        //     color: Colors.black.withOpacity(0.79),
        //   ),
        // ),
        const SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.screenMargin),
              child: _SpeedDuelFieldBuilder(),
            ),
          ),
        ),
      ],
    );
  }
}

class _SpeedDuelFieldBuilder extends HookWidget {
  const _SpeedDuelFieldBuilder();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);
    final speedDuelState = useStream(vm.speedDuelState, initialData: const SpeedDuelLoading());

    return speedDuelState.data.when(
      (playerState) => _SpeedDuelField(playerState: playerState),
      loading: () => const GeneralLoadingState(),
      error: () => const GeneralErrorState(description: 'An error occurred while starting the speed duel'),
    );
  }
}

class _SpeedDuelField extends StatelessWidget {
  final PlayerState playerState;

  const _SpeedDuelField({
    @required this.playerState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: MainMonsterRow(playerState: playerState),
        ),
        const SizedBox(height: AppDimensions.duelFieldFirstSecondRowSpacing),
        Expanded(
          child: SpellTrapRow(playerState: playerState),
        ),
        const SizedBox(height: AppDimensions.duelFieldSecondHandRowSpacing),
        Expanded(
          child: HandRow(zone: playerState.hand),
        ),
      ],
    );
  }
}
