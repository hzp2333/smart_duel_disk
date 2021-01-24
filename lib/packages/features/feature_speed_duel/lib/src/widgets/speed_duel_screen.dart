import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/core_data_manager_interface.dart';
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
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: _Body(),
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
          child: _HandRow(hand: playerState.hand.cards),
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
        _SingleCardFieldZone(zone: playerState.fieldZone),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SingleCardFieldZone(zone: playerState.mainMonsterZone1),
            const SizedBox(width: 16),
            _SingleCardFieldZone(zone: playerState.mainMonsterZone2),
            const SizedBox(width: 16),
            _SingleCardFieldZone(zone: playerState.mainMonsterZone3),
          ],
        ),
        _SingleCardFieldZone(zone: playerState.graveyardZone),
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
        _SingleCardFieldZone(zone: playerState.extraDeckZone),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SingleCardFieldZone(zone: playerState.spellTrapZone1),
            const SizedBox(width: 16),
            _SingleCardFieldZone(zone: playerState.spellTrapZone2),
            const SizedBox(width: 16),
            _SingleCardFieldZone(zone: playerState.spellTrapZone3),
          ],
        ),
        _SingleCardFieldZone(zone: playerState.deckZone),
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

    return DragTarget<YugiohCard>(
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
            : _DraggableCard(yugiohCard: zone.cards.first);
      },
    );
  }
}

class _HandRow extends StatelessWidget {
  final Iterable<YugiohCard> hand;

  const _HandRow({
    @required this.hand,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: hand.length,
      itemBuilder: (_, index) => _DraggableCard(yugiohCard: hand.elementAt(index)),
      separatorBuilder: (_, __) => const SizedBox(width: 16),
    );
  }
}

class _DraggableCard extends StatelessWidget {
  final YugiohCard yugiohCard;

  const _DraggableCard({
    @required this.yugiohCard,
  });

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);

    return Draggable<YugiohCard>(
      maxSimultaneousDrags: 1,
      onDragStarted: HapticFeedback.selectionClick,
      data: yugiohCard,
      feedback: _CardImage(
        imageUrl: yugiohCard.imageSmallUrl,
        placeholderAssetId: assetsProvider.cardBack,
      ),
      childWhenDragging: const _SingleCardFieldZone(
        zone: Zone(zoneType: ZoneType.hand),
      ),
      child: _CardImage(
        imageUrl: yugiohCard.imageSmallUrl,
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
