import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../deck_viewmodel.dart';

class PersonalDecks extends StatelessWidget with ProviderMixin {
  const PersonalDecks();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DeckViewModel>(context);
    final stringProvider = getStringProvider(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
