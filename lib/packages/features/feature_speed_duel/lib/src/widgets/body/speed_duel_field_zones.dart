import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/deck_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
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
    return CardDragTarget(
      zone: zone,
      child: ZoneBackground(
        zoneType: zone.zoneType,
        card: zone.cards.isEmpty
            ? null
            : DraggableCard(
                card: zone.cards.first,
                zone: zone,
              ),
      ),
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
    final vm = Provider.of<SpeedDuelViewModel>(context);
    final assetsProvider = Provider.of<AssetsProvider>(context);

    final cardBack = assetsProvider.cardBack;
    final amountOfCards = zone.cards.length.toString();

    final onPressed = zone.zoneType == ZoneType.deck ? null : () => vm.onMultiCardZonePressed(zone);

    return CardDragTarget(
      zone: zone,
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (zone.cards.isEmpty) ...{
              ZoneBackground(zoneType: zone.zoneType),
            } else if (showCardBack) ...{
              ImagePlaceholder(imageAssetId: cardBack),
            } else ...{
              CardImage(
                playCard: zone.cards.last,
                placeholderImage: cardBack,
              ),
            },
            if (zone.cards.isNotEmpty) ...{
              BorderedText(text: amountOfCards),
            },
          ],
        ),
      ),
    );
  }
}

class DeckZone extends StatelessWidget {
  final Zone zone;

  const DeckZone({
    @required this.zone,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return CardDragTarget(
      zone: zone,
      child: PopupMenuButton<DeckAction>(
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
          showCardBack: true,
        ),
      ),
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

class ZoneBackground extends StatelessWidget {
  final ZoneType zoneType;
  final Widget card;

  const ZoneBackground({
    @required this.zoneType,
    this.card,
  });

  @override
  Widget build(BuildContext context) {
    final cardHeight = context.playCardHeight;
    final cardWidth = context.playCardHeight * AppDimensions.yugiohCardAspectRatio;
    final zoneWidth = zoneType.isMainMonsterZone || zoneType.isSpellTrapCardZone ? cardHeight : null;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: cardHeight,
          width: zoneWidth,
        ),
        if (zoneType.isMainMonsterZone) ...{
          Container(
            width: cardHeight,
            height: cardWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70),
            ),
          ),
        },
        AspectRatio(
          aspectRatio: AppDimensions.yugiohCardAspectRatio,
          child: Container(
            height: cardHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
          ),
        ),
        if (card != null) ...{
          card,
        },
      ],
    );
  }
}

class CardDragTarget extends StatelessWidget {
  final Zone zone;
  final Widget child;

  const CardDragTarget({
    @required this.zone,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SpeedDuelViewModel>(context);

    return DragTarget<PlayCard>(
      onWillAccept: (card) => vm.onWillZoneAcceptCard(card, zone),
      onAccept: (card) => vm.onZoneAcceptsCard(card, zone),
      builder: (_, __, ___) => child,
    );
  }
}
