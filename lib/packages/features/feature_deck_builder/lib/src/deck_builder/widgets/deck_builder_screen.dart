import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      title: TextFieldWithoutValidation(
        hintText: Strings.deckBuilderSearchHint.get(),
        onChanged: vm.onTextFilterChanged,
        onClearPressed: vm.onClearTextFilterPressed,
      ),
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

    return StreamBuilder<DeckBuilderState>(
      stream: vm.deckBuilderState,
      initialData: const DeckBuilderState.loading(),
      builder: (context, snapshot) {
        return snapshot.data.when(
          (speedDuelCards) => CardGrid(yugiohCards: speedDuelCards),
          loading: () => const _LoadingBody(),
          noData: () => const _NoCardsBody(),
          error: () => const _ErrorBody(),
        );
      },
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
