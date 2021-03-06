import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/widgets/body/card_zones/shared.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_assets/wrapper_assets_interface/lib/wrapper_assets_interface.dart';

class DraggableCard extends StatelessWidget {
  final PlayCard card;
  final Zone zone;
  final VoidCallback onDragStarted;

  const DraggableCard({
    @required this.card,
    @required this.zone,
    this.onDragStarted,
  });

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);
    final cardBack = assetsProvider.cardBack;

    return Draggable<PlayCard>(
      maxSimultaneousDrags: 1,
      onDragStarted: () {
        HapticFeedback.selectionClick();
        onDragStarted?.call();
      },
      data: card,
      feedback: CardImage(
        playCard: card,
        placeholderImage: cardBack,
      ),
      childWhenDragging: zone.zoneType == ZoneType.hand ? const SizedBox.shrink() : const EmptyZone(),
      child: CardImage(
        playCard: card,
        placeholderImage: cardBack,
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final PlayCard playCard;
  final String placeholderImage;

  const CardImage({
    @required this.playCard,
    @required this.placeholderImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog<void>(
          context: context,
          builder: (context) {
            return _DialogContainer(
              playCard: playCard,
            );
          }),
      child: CachedNetworkImage(
        imageUrl: playCard.yugiohCard.imageSmallUrl,
        fit: BoxFit.fitHeight,
        placeholder: (_, __) => ImagePlaceholder(imageAssetId: placeholderImage),
        errorWidget: (_, __, dynamic ___) => ImagePlaceholder(imageAssetId: placeholderImage),
      ),
    );
  }
}

class _DialogContainer extends StatelessWidget {
  final PlayCard playCard;

  const _DialogContainer({
    @required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.black.withOpacity(0.4),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryAccentColor),
            ),
            child: _DialogBody(playCard: playCard),
          ),
        ),
      ),
    );
  }
}

class _DialogBody extends StatelessWidget {
  final PlayCard playCard;

  const _DialogBody({
    @required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FirstRow(playCard: playCard),
        const SizedBox(height: 4),
        _SecondRow(playCard: playCard),
        const SizedBox(height: 8),
        _ThirdRow(playCard: playCard),
        const SizedBox(height: 2),
        _CardDescription(playCard: playCard),
      ],
    );
  }
}

class _FirstRow extends StatelessWidget {
  final PlayCard playCard;

  const _FirstRow({
    @required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            playCard.yugiohCard.name,
            style: TextStyles.cardDialogBigText,
          ),
        ),
        ImageAssetProvider(
          assetName: playCard.attributeAssetName,
          size: AppDimensions.iconSize24,
        ),
      ],
    );
  }
}

class _SecondRow extends StatelessWidget {
  final PlayCard playCard;

  const _SecondRow({
    @required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (playCard.formattedLevel != null) ...{
          Expanded(
            child: _MonsterLevel(playCard: playCard),
          ),
        },
        if (playCard.formattedAttack != null && playCard.formattedDefence != null) ...{
          Expanded(
            flex: 2,
            child: _MonsterAttackAndDefence(playCard: playCard),
          ),
        },
      ],
    );
  }
}

class _MonsterLevel extends StatelessWidget {
  final PlayCard playCard;

  const _MonsterLevel({
    @required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    final assetsProvider = Provider.of<AssetsProvider>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageAssetProvider(
          assetName: assetsProvider.iconCardLevel,
          size: AppDimensions.iconSize16,
        ),
        const SizedBox(width: 4),
        Text(
          playCard.formattedLevel,
          style: TextStyles.cardDialogBigText,
        ),
      ],
    );
  }
}

class _MonsterAttackAndDefence extends StatelessWidget {
  final PlayCard playCard;

  const _MonsterAttackAndDefence({
    @required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          playCard.formattedAttack,
          style: TextStyles.cardDialogBigText,
        ),
        const SizedBox(width: AppDimensions.screenMargin),
        Text(
          playCard.formattedDefence,
          style: TextStyles.cardDialogBigText,
        ),
      ],
    );
  }
}

class _ThirdRow extends StatelessWidget {
  final PlayCard playCard;

  const _ThirdRow({
    @required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      playCard.formattedRaceAndType,
      style: TextStyle(color: AppColors.cardDialogAccent),
    );
  }
}

class _CardDescription extends StatelessWidget {
  final PlayCard playCard;

  const _CardDescription({
    @required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      playCard.yugiohCard.description,
      textAlign: TextAlign.start,
    );
  }
}
