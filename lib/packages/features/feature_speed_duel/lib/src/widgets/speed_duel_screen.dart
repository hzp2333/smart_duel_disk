import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
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

  StreamSubscription<SpeedDuelScreenEvent>? _speedDuelEventSubscription;
  PersistentBottomSheetController<void>? _bottomSheetController;

  @override
  void initState() {
    super.initState();

    final vm = Provider.of<SpeedDuelViewModel>(context, listen: false);
    vm.init();

    _speedDuelEventSubscription = vm.screenEvent.listen((event) {
      event.when(
        hideOverlays: () => _closeBottomSheet(),
        inspectCardPile: (playerState, zone) => _onInspectCardPileEventReceived(playerState, zone),
      );
    });
  }

  @override
  void dispose() {
    _speedDuelEventSubscription?.cancel();
    _speedDuelEventSubscription = null;

    super.dispose();
  }

  void _onInspectCardPileEventReceived(PlayerState playerState, Zone zone) {
    _closeBottomSheet();

    _bottomSheetController = _scaffoldKey.currentState!.showBottomSheet(
      (_) => CardListBottomSheet(playerState: playerState, zone: zone),
      backgroundColor: AppColors.cardBackgroundColor.withOpacity(0.9),
    );
  }

  void _closeBottomSheet() {
    try {
      _bottomSheetController?.close();
      _bottomSheetController = null;
    } catch (e) {
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
          child: _ScaffoldBuilder(scaffoldKey: _scaffoldKey),
        ),
      ),
    );
  }
}

class _ScaffoldBuilder extends HookWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _ScaffoldBuilder({
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);
    final state = useStream(vm.screenState, initialData: const SpeedDuelLoading());

    return Scaffold(
      key: scaffoldKey,
      appBar: state.data is SpeedDuelError ? const _AppBar() : null,
      body: _BodyBuilder(state: state.data!),
      backgroundColor: AppColors.primaryBackgroundColor,
    );
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: const BackButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BodyBuilder extends StatelessWidget {
  final SpeedDuelScreenState state;

  const _BodyBuilder({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: state.when(
        (state) => SpeedDuelField(state: state),
        loading: () => const GeneralLoadingState(),
        error: () => const GeneralErrorState(description: 'An error occurred while starting the speed duel'),
      ),
    );
  }
}
