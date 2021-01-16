import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';

import '../../deck_viewmodel.dart';

class PersonalDecks extends StatelessWidget {
  const PersonalDecks();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckViewModel>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconTitleTile(
          icon: Icons.add,
          title: Strings.deckPersonalCreateDeck.get(),
          onPressed: () => context.snackbar(
            Strings.featureNotAvailableYetDescription.get('Creating a personal deck'),
          ),
        ),
        const SizedBox(height: AppDimensions.deckPersonalCardSeparator),
        IconTitleTile(
          icon: Icons.search,
          title: Strings.deckPersonalSearchCard.get(),
          onPressed: vm.onSearchCardPressed,
        ),
      ],
    );
  }
}
