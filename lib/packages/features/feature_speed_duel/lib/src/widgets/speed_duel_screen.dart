import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/deck_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/player_state.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';

import '../speed_duel_viewmodel.dart';

class SpeedDuelScreen extends StatefulWidget {
  const SpeedDuelScreen();

  @override
  _SpeedDuelScreenState createState() => _SpeedDuelScreenState();
}

class _SpeedDuelScreenState extends State<SpeedDuelScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    // Make the app full screen.
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _scaffoldKey.currentState.showSnackBar(const SnackBar(
          content: Text('You cannot close the screen regularly. Click the deck and choose the surrender option'),
        ));

        return Future.value(false);
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.primaryBackgroundColor,
        body: const _Body(),
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
          child: _PlayerFieldBuilder(),
        ),
      ),
    );
  }
}

class _PlayerFieldBuilder extends StatelessWidget {
  const _PlayerFieldBuilder();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return StreamBuilder<PlayerState>(
      stream: vm.playerState,
      initialData: const PlayerState(),
      builder: (context, snapshot) {
        return _PlayerField(playerState: snapshot.data);
      },
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
          child: _HandRow(zone: playerState.hand),
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
            _SingleCardFieldZone(zone: playerState.fieldZone),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SingleCardFieldZone(zone: playerState.mainMonsterZone1),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            _SingleCardFieldZone(zone: playerState.mainMonsterZone2),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            _SingleCardFieldZone(zone: playerState.mainMonsterZone3),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MultiCardFieldZoneBuilder(
              zone: playerState.graveyardZone,
              showCardBack: false,
            ),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            _MultiCardFieldZoneBuilder(
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
            _MultiCardFieldZoneBuilder(
              zone: playerState.extraDeckZone,
              showCardBack: true,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SingleCardFieldZone(zone: playerState.spellTrapZone1),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            _SingleCardFieldZone(zone: playerState.spellTrapZone2),
            const SizedBox(width: AppDimensions.duelFieldCardSpacing),
            _SingleCardFieldZone(zone: playerState.spellTrapZone3),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DeckZone(
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

class _SingleCardFieldZone extends StatelessWidget {
  final Zone zone;

  const _SingleCardFieldZone({
    @required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return DragTarget<PlayCard>(
      onWillAccept: (card) => vm.onWillAccept(card, zone),
      onAccept: (card) => vm.onAccept(card, zone),
      builder: (_, __, ___) {
        return zone.cards.isEmpty
            ? AspectRatio(
                aspectRatio: AppDimensions.yugiohCardAspectRatio,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: const SizedBox.expand(),
                ),
              )
            : _DraggableCard(
                card: zone.cards.first,
                zone: zone,
              );
      },
    );
  }
}

class _MultiCardFieldZoneBuilder extends StatelessWidget {
  final Zone zone;
  final bool showCardBack;

  const _MultiCardFieldZoneBuilder({
    @required this.zone,
    @required this.showCardBack,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return DragTarget<PlayCard>(
      onWillAccept: (card) => vm.onWillAccept(card, zone),
      onAccept: (card) => vm.onAccept(card, zone),
      builder: (_, __, ___) {
        return _MultiCardFieldZone(
          zone: zone,
          showCardBack: showCardBack,
        );
      },
    );
  }
}

class _DeckZone extends StatelessWidget {
  final Zone zone;
  final bool showCardBack;

  const _DeckZone({
    @required this.zone,
    @required this.showCardBack,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return DragTarget<PlayCard>(
      onWillAccept: (card) => vm.onWillAccept(card, zone),
      onAccept: (card) => vm.onAccept(card, zone),
      builder: (_, __, ___) {
        return PopupMenuButton<DeckAction>(
          onSelected: vm.onDeckActionSelected,
          tooltip: 'Show deck actions',
          padding: EdgeInsets.zero,
          itemBuilder: (context) => [
            const PopupMenuItem<DeckAction>(
              value: DeckAction.drawCard,
              child: _DeckZoneMenuItem(
                title: 'Draw card',
                icon: Icons.credit_card,
              ),
            ),
            const PopupMenuItem<DeckAction>(
              value: DeckAction.surrender,
              child: _DeckZoneMenuItem(
                title: 'Surrender',
                icon: Icons.flag,
              ),
            ),
          ],
          child: _MultiCardFieldZone(
            zone: zone,
            showCardBack: showCardBack,
          ),
        );
      },
    );
  }
}

class _DeckZoneMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _DeckZoneMenuItem({
    @required this.title,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
    );
  }
}

class _MultiCardFieldZone extends StatelessWidget {
  final Zone zone;
  final bool showCardBack;

  const _MultiCardFieldZone({
    @required this.zone,
    @required this.showCardBack,
  });

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);
    final amountOfCards = zone.cards.length.toString();

    return Stack(
      alignment: Alignment.center,
      children: [
        if (zone.cards.isEmpty) ...{
          const _EmptyZone(),
        } else if (showCardBack) ...{
          ImagePlaceholder(imageAssetId: assetsProvider.cardBack),
        } else ...{
          _CardImage(
            imageUrl: zone.cards.last.yugiohCard.imageSmallUrl,
            placeholderAssetId: assetsProvider.cardBack,
          ),
        },
        if (zone.cards.isNotEmpty) ...{
          Stack(
            children: [
              Text(
                amountOfCards,
                style: TextStyle(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.black,
                ),
              ),
              Text(amountOfCards),
            ],
          ),
        }
      ],
    );
  }
}

class _HandRow extends StatelessWidget {
  final Zone zone;

  const _HandRow({
    @required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return DragTarget<PlayCard>(
      onWillAccept: (card) => vm.onWillAccept(card, zone),
      onAccept: (card) => vm.onAccept(card, zone),
      builder: (_, __, ___) {
        return SizedBox.expand(
          child: Center(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: zone.cards.length,
              itemBuilder: (_, index) => _DraggableCard(
                card: zone.cards.elementAt(index),
                zone: zone,
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 16),
            ),
          ),
        );
      },
    );
  }
}

class _DraggableCard extends StatelessWidget {
  final PlayCard card;
  final Zone zone;

  const _DraggableCard({
    @required this.card,
    @required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);

    return Draggable<PlayCard>(
      maxSimultaneousDrags: 1,
      onDragStarted: HapticFeedback.selectionClick,
      data: card,
      feedback: _CardImage(
        imageUrl: card.yugiohCard.imageSmallUrl,
        placeholderAssetId: assetsProvider.cardBack,
      ),
      childWhenDragging: zone.zoneType == ZoneType.hand
          ? const SizedBox.shrink()
          : _SingleCardFieldZone(
              zone: Zone(zoneType: zone.zoneType),
            ),
      child: _CardImage(
        imageUrl: card.yugiohCard.imageSmallUrl,
        placeholderAssetId: assetsProvider.cardBack,
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final String imageUrl;
  final String placeholderAssetId;

  const _CardImage({
    @required this.imageUrl,
    @required this.placeholderAssetId,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fitHeight,
      placeholder: (_, __) => ImagePlaceholder(imageAssetId: placeholderAssetId),
      errorWidget: (_, __, dynamic ___) => ImagePlaceholder(imageAssetId: placeholderAssetId),
    );
  }
}

class _EmptyZone extends StatelessWidget {
  const _EmptyZone();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppDimensions.yugiohCardAspectRatio,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: const SizedBox.expand(),
      ),
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
