import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/models/play_card_dialog_action.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/play_card_dialog/play_card_dialog_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class PlayCardDialog extends StatelessWidget {
  const PlayCardDialog();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PlayCardDialogViewModel>(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            margin: EdgeInsets.zero,
            color: AppColors.cardDialogBackgroundColor,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Container(
                padding: const EdgeInsets.all(AppSizes.screenMargin),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryAccentColor),
                ),
                child: _DialogBody(playCard: vm.playCard),
              ),
            ),
          ),
          if (vm.cardActions != null) ...{
            _ActionsRow(actions: vm.cardActions),
          },
        ],
      ),
    );
  }
}

class _DialogBody extends StatelessWidget {
  final PlayCard? playCard;

  const _DialogBody({
    required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    final showSecondRow =
        playCard!.formattedLevel != null || (playCard!.formattedAttack != null && playCard!.formattedDefence != null);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FirstRow(playCard: playCard),
        if (showSecondRow) ...{
          const SizedBox(height: 4),
          _SecondRow(playCard: playCard),
        },
        const SizedBox(height: 8),
        _ThirdRow(playCard: playCard),
        const SizedBox(height: 4),
        _CardDescription(playCard: playCard),
      ],
    );
  }
}

class _FirstRow extends StatelessWidget {
  final PlayCard? playCard;

  const _FirstRow({
    required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            playCard!.yugiohCard.name,
            style: TextStyles.cardDialogBigText,
          ),
        ),
        if (playCard!.attributeAssetName != null) ...[
          ImageAssetProvider(
            assetName: playCard!.attributeAssetName!,
            size: AppSizes.iconSize24,
          ),
        ],
      ],
    );
  }
}

class _SecondRow extends StatelessWidget {
  final PlayCard? playCard;

  const _SecondRow({
    required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (playCard!.formattedLevel != null) ...{
          Expanded(
            child: _MonsterLevel(playCard: playCard),
          ),
        },
        if (playCard!.formattedAttack != null && playCard!.formattedDefence != null) ...{
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
  final PlayCard? playCard;

  const _MonsterLevel({
    required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageAssetProvider(
          assetName: Assets.icons.icCardLevel.path,
          size: AppSizes.iconSize16,
        ),
        const SizedBox(width: 4),
        Text(
          playCard!.formattedLevel!,
          style: TextStyles.cardDialogBigText,
        ),
      ],
    );
  }
}

class _MonsterAttackAndDefence extends StatelessWidget {
  final PlayCard? playCard;

  const _MonsterAttackAndDefence({
    required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          playCard!.formattedAttack!,
          style: TextStyles.cardDialogBigText,
        ),
        const SizedBox(width: AppSizes.screenMargin),
        Text(
          playCard!.formattedDefence!,
          style: TextStyles.cardDialogBigText,
        ),
      ],
    );
  }
}

class _ThirdRow extends StatelessWidget {
  final PlayCard? playCard;

  const _ThirdRow({
    required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      playCard!.formattedRaceAndType,
      style: TextStyle(color: AppColors.cardDialogAccent),
    );
  }
}

class _CardDescription extends StatelessWidget {
  final PlayCard? playCard;

  const _CardDescription({
    required this.playCard,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 4,
      ),
      child: SingleChildScrollView(
        child: Text(
          playCard!.yugiohCard.description,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final Iterable<PlayCardDialogAction>? actions;

  const _ActionsRow({
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: actions!.map((action) => _ActionItem(action: action)).toList(),
      ),
    );
  }
}

class _ActionItem extends StatelessWidget with ProviderMixin {
  final PlayCardDialogAction action;

  const _ActionItem({
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PlayCardDialogViewModel>(context);
    final stringProvider = getStringProvider(context);

    return InkWell(
      onTap: () => vm.onPlayCardDialogActionPressed(action.type),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenMarginLarge,
          vertical: AppSizes.screenMarginSmall,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardDialogBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(action.icon),
            const SizedBox(height: AppSizes.iconTitleTileSeparator),
            Text(
              stringProvider.getString(action.name),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
