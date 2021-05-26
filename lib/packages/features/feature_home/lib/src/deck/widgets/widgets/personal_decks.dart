import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/src/localization/strings.al.dart';

import '../../deck_viewmodel.dart';

class PersonalDecks extends StatelessWidget {
  const PersonalDecks();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckViewModel>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconTitleTileButton(
          icon: Icons.add,
          title: Strings.deckPersonalCreateDeck.get(),
          onPressed: vm.onBuildDeckPressed,
        ),
        const SizedBox(height: AppDimensions.iconTitleTileSeparator),
        IconTitleTileButton(
          icon: Icons.search,
          title: Strings.deckPersonalSearchCard.get(),
          onPressed: vm.onSearchCardPressed,
        ),
      ],
    );
  }
}
