import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../deck_viewmodel.dart';
import '../models/deck_state.dart';
import 'body/personal_decks.dart';
import 'body/pre_built_decks.dart';

class DeckScreen extends HookWidget with ProviderMixin {
  const DeckScreen();

  @override
  Widget build(BuildContext context) {
    final vm = getViewModel<DeckViewModel>(context);
    final deckState = useStream(useMemoized(() => vm.deckState));

    final body = deckState.hasData ? _DeckScreenBody(state: deckState.requireData) : const SizedBox.shrink();

    if (!vm.isDetailScreen) {
      return body;
    }

    return Scaffold(
      appBar: const SddAppBar(title: 'Decks'),
      body: body,
    );
  }
}

class _DeckScreenBody extends StatelessWidget with ProviderMixin {
  final DeckState state;

  const _DeckScreenBody({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(AppSizes.screenMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Section(
                title: stringProvider.getString(LocaleKeys.deck_pre_built_decks_title),
                child: const PreBuiltDecksSection(),
              ),
              const SizedBox(height: AppSizes.deckSectionSeparator),
              Section(
                title: stringProvider.getString(LocaleKeys.deck_personal_decks_title),
                child: PersonalDecksSection(decks: state.decks),
              ),
            ],
          ),
        ),
        if (state.loading) ...[
          const SizedBox.expand(),
          Positioned.fill(
            child: AbsorbPointer(
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
          const Align(child: LoadingIndicator()),
        ],
      ],
    );
  }
}
