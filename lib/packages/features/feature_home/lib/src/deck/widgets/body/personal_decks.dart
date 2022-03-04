import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../deck_viewmodel.dart';
import 'deck_list_item.dart';

class PersonalDecksSection extends StatelessWidget with ProviderMixin {
  final Iterable<UserDeck> decks;

  const PersonalDecksSection({
    required this.decks,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckViewModel>(context);
    final stringProvider = getStringProvider(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (decks.isNotEmpty) ...[
          _PersonalDeckList(decks: decks),
          const SizedBox(height: AppSizes.screenMargin),
        ],
        IconTitleTileButton(
          icon: Icons.add,
          title: stringProvider.getString(LocaleKeys.deck_personal_create_deck),
          onPressed: vm.onBuildDeckPressed,
        ),
        const SizedBox(height: AppSizes.iconTitleTileSeparator),
        IconTitleTileButton(
          icon: Icons.search,
          title: stringProvider.getString(LocaleKeys.deck_personal_search_card),
          onPressed: vm.onSearchCardPressed,
        ),
      ],
    );
  }
}

class _PersonalDeckList extends StatelessWidget with ProviderMixin {
  final Iterable<UserDeck> decks;

  const _PersonalDeckList({
    required this.decks,
  });

  @override
  Widget build(BuildContext context) {
    final vm = getViewModel<DeckViewModel>(context);

    return SizedBox(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: decks.length,
        itemBuilder: (_, index) {
          final deck = decks.elementAt(index);

          return DeckListItem(
            backgroundColor: AppColors.cardBackgroundColor,
            image: _DeckImage(deck: deck),
            deckName: deck.name,
            onPressed: () => vm.onPersonalDeckPressed(deck),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: AppSizes.screenMargin),
      ),
    );
  }
}

class _DeckImage extends StatelessWidget {
  final UserDeck deck;

  const _DeckImage({
    required this.deck,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.screenMarginSmall),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            left: AppSizes.screenMarginSmall,
            top: 0,
            bottom: 0,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(350 / 360),
              alignment: Alignment.bottomCenter,
              child: _CardImage(cardId: deck.cardIds.elementAt(1)),
            ),
          ),
          Positioned(
            right: AppSizes.screenMarginSmall,
            top: 0,
            bottom: 0,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(10 / 360),
              alignment: Alignment.bottomCenter,
              child: _CardImage(cardId: deck.cardIds.elementAt(2)),
            ),
          ),
          _CardImage(cardId: deck.cardIds.elementAt(0)),
        ],
      ),
    );
  }
}

class _CardImage extends StatelessWidget with ProviderMixin {
  final int cardId;

  _CardImage({
    required this.cardId,
  });

  @override
  Widget build(BuildContext context) {
    final vm = getViewModel<DeckViewModel>(context);

    return FutureBuilder<CardCopy>(
      future: vm.getCardCopy(cardId),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const LoadingIndicator();
        }

        final cardCopy = snapshot.requireData;
        return CardImage(
          card: cardCopy.card,
          image: cardCopy.image,
        );
      },
    );
  }
}
