import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/deck_builder_viewmodel.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/models/deck_builder_section.dart';
import 'package:smart_duel_disk/packages/features/feature_deck_builder/lib/src/deck_builder/models/deck_builder_state.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import 'body/card_grid.dart';

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

class _AppBar extends HookWidget with ProviderMixin implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckBuilderViewModel>(context);
    final stringProvider = getStringProvider(context);

    final editMode = useStream(useMemoized(() => vm.isEditMode), initialData: false);
    final isEditMode = editMode.requireData;

    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryBackgroundColor,
      leading: const BackButton(color: AppColors.primaryIconColor),
      title: isEditMode
          ? TextFieldWithValidation(
              label: '',
              hint: 'Deck name',
              textStream: vm.deckName,
              onChanged: vm.onDeckNameChanged,
              onSubmitted: vm.onDeckNameSubmitted,
            )
          : vm.deckTitle != null
              ? Text(
                  vm.deckTitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              : TextFieldWithoutValidation(
                  hintText: stringProvider.getString(LocaleKeys.deck_builder_search_hint),
                  onChanged: vm.onSearchFilterChanged,
                  onClearPressed: vm.onClearSearchFilterPressed,
                ),
      actions: vm.isPersonalDeck
          ? [
              IconButton(
                icon: const Icon(Icons.edit),
                tooltip: 'Edit deck',
                onPressed: vm.onEditDeckPressed,
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Delete deck',
                onPressed: vm.onDeleteDeckPressed,
              ),
            ]
          : null,
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
        initialData: const DeckBuilderLoading(),
        builder: (context, snapshot) {
          return snapshot.data!.when(
            filtered: (cards) => CardGrid(cards: cards),
            preBuilt: (sections) => _PreBuiltDeckBody(sections: sections),
            loading: () => const _LoadingBody(),
            noData: () => const _NoDataBody(),
            error: () => const _ErrorBody(),
          );
        },
      ),
    );
  }
}

class _PreBuiltDeckBody extends StatelessWidget {
  final Iterable<DeckBuilderSection> sections;

  const _PreBuiltDeckBody({
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: sections.length,
        itemBuilder: (context, index) => _PreBuiltDeckSection(section: sections.elementAt(index)),
        separatorBuilder: (context, index) => const SizedBox(height: AppSizes.deckBuilderSectionSeparator),
      ),
    );
  }
}

class _PreBuiltDeckSection extends StatelessWidget with ProviderMixin {
  final DeckBuilderSection section;

  const _PreBuiltDeckSection({
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenMarginSmall),
          child: SectionTitle(title: stringProvider.getString(section.titleId)),
        ),
        CardGrid(
          cards: section.cards,
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

class _NoDataBody extends StatelessWidget with ProviderMixin {
  const _NoDataBody();

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return GeneralErrorState(
      description: stringProvider.getString(LocaleKeys.deck_builder_no_data_error_description),
    );
  }
}

class _ErrorBody extends StatelessWidget with ProviderMixin {
  const _ErrorBody();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckBuilderViewModel>(context);
    final stringProvider = getStringProvider(context);

    return GeneralErrorState(
      description: stringProvider.getString(LocaleKeys.deck_builder_general_error_description),
      canRetry: true,
      retryAction: vm.onRetryPressed,
    );
  }
}
