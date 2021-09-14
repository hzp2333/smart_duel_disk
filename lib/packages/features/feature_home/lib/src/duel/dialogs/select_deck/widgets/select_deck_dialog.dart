import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../select_deck_dialog_viewmodel.dart';

class SelectDeckDialog extends StatelessWidget {
  const SelectDeckDialog();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SelectDeckDialogViewModel>(context);
    final decks = vm.getPreBuiltDecks();

    return Center(
      child: Card(
        margin: const EdgeInsets.all(AppSizes.screenMarginLarge),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: decks.length,
          itemBuilder: (_, index) => _DeckListItem(deck: decks.elementAt(index)),
          separatorBuilder: (_, index) => Container(
            height: 4,
            width: double.infinity,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _DeckListItem extends StatelessWidget with ProviderMixin {
  final PreBuiltDeck deck;

  const _DeckListItem({
    required this.deck,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SelectDeckDialogViewModel>(context);
    final stringProvider = getStringProvider(context);

    return ListTile(
      title: Text(stringProvider.getString(deck.titleId)),
      onTap: () => vm.onDeckSelected(deck),
      trailing: const Icon(Icons.chevron_right),
      horizontalTitleGap: 0,
      leading: GestureDetector(
        onTap: () => vm.getDeckInfo(deck),
        child: const Icon(Icons.info_outline),
      ),
    );
  }
}
