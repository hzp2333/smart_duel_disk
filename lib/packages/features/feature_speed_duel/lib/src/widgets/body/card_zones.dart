import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/deck_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';

import '../../speed_duel_viewmodel.dart';
import 'draggable_card.dart';

class SingleCardFieldZone extends StatelessWidget {
  final Zone zone;

  const SingleCardFieldZone({
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
            : DraggableCard(
                card: zone.cards.first,
                zone: zone,
              );
      },
    );
  }
}

class MultiCardFieldZoneBuilder extends StatelessWidget {
  final Zone zone;
  final bool showCardBack;

  const MultiCardFieldZoneBuilder({
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
        return GestureDetector(
          onTap: () => vm.onMultiCardZonePressed(zone),
          child: MultiCardFieldZone(
            zone: zone,
            showCardBack: showCardBack,
          ),
        );
      },
    );
  }
}

class DeckZone extends StatelessWidget {
  final Zone zone;
  final bool showCardBack;

  const DeckZone({
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
              value: DeckAction.showDeckList,
              child: _DeckZoneMenuItem(
                title: 'Show deck list',
                icon: Icons.view_carousel_rounded,
              ),
            ),
            const PopupMenuItem<DeckAction>(
              value: DeckAction.shuffleDeck,
              child: _DeckZoneMenuItem(
                title: 'Shuffle deck',
                icon: Icons.shuffle,
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
          child: MultiCardFieldZone(
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

class MultiCardFieldZone extends StatelessWidget {
  final Zone zone;
  final bool showCardBack;

  const MultiCardFieldZone({
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
          CardImage(
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

class HandRow extends StatelessWidget {
  final Zone zone;

  const HandRow({
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
              itemBuilder: (_, index) => DraggableCard(
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
