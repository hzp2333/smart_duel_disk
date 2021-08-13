import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/models/deck_builder_state.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

import 'widgets/card_grid.dart';

class DeckBuilderScreen extends StatefulWidget {
  const DeckBuilderScreen();

  @override
  _DeckBuilderScreenState createState() => _DeckBuilderScreenState();
}

class _DeckBuilderScreenState extends State<DeckBuilderScreen> {
  @override
  void initState() {
    super.initState();

    final vm = Provider.of<DeckBuilderViewModel>(context, listen: false);
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
      backgroundColor: AppColors.primaryBackgroundColor,
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckBuilderViewModel>(context);

    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryBackgroundColor,
      leading: const BackButton(color: AppColors.primaryIconColor),
      title: vm.showFilter
          ? TextFieldWithoutValidation(
              hintText: Strings.deckBuilderSearchHint.get(),
              onChanged: vm.onTextFilterChanged,
              onClearPressed: vm.onClearTextFilterPressed,
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckBuilderViewModel>(context);

    return ScrollConfiguration(
      behavior: const NoScrollGlowBehavior(),
      child: StreamBuilder<DeckBuilderState>(
        stream: vm.deckBuilderState,
        initialData: const DeckBuilderState.loading(),
        builder: (context, snapshot) {
          return snapshot.data.when(
            (cards, isPreBuilt) => isPreBuilt ? _PreBuiltDeckBody(yugiohCards: cards) : CardGrid(yugiohCards: cards),
            loading: () => const _LoadingBody(),
            noData: () => const _NoCardsBody(),
            error: () => const _ErrorBody(),
          );
        },
      ),
    );
  }
}

class _PreBuiltDeckBody extends StatelessWidget {
  final Map<String, Iterable<YugiohCard>> cardTypeSections;

  _PreBuiltDeckBody({
    @required Iterable<YugiohCard> yugiohCards,
  }) : cardTypeSections = {
          'Monster cards': yugiohCards.where((card) =>
              card.type != CardType.fusionMonster && card.type != CardType.spellCard && card.type != CardType.trapCard),
          'Spell cards': yugiohCards.where((card) => card.type == CardType.spellCard),
          'Trap cards': yugiohCards.where((card) => card.type == CardType.trapCard),
          'Extra deck': yugiohCards.where((card) => card.type == CardType.fusionMonster),
        }..removeWhere((key, value) => value.isEmpty);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: cardTypeSections.length,
      itemBuilder: (context, index) {
        final cardTypeSection = cardTypeSections.entries.elementAt(index);

        return _PreBuiltDeckSection(
          title: cardTypeSection.key,
          yugiohCards: cardTypeSection.value,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: AppSizes.deckBuilderSectionSeparator),
    );
  }
}

class _PreBuiltDeckSection extends StatelessWidget {
  final String title;
  final Iterable<YugiohCard> yugiohCards;

  const _PreBuiltDeckSection({
    @required this.title,
    @required this.yugiohCards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenMarginSmall),
          child: SectionTitle(title: title),
        ),
        CardGrid(
          yugiohCards: yugiohCards,
          scrollPhysics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return const GeneralLoadingState();
  }
}

class _NoCardsBody extends StatelessWidget {
  const _NoCardsBody();

  @override
  Widget build(BuildContext context) {
    return GeneralErrorState(
      description: Strings.deckBuilderNoDataErrorDescription.get(),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckBuilderViewModel>(context);

    return GeneralErrorState(
      description: Strings.deckBuilderGeneralErrorDescription.get(),
      canRetry: true,
      retryAction: vm.onRetryPressed,
    );
  }
}
