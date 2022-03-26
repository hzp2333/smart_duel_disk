import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/entities/entities.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../../duel_room_viewmodel.dart';
import '../../models/deck_list_state.dart';

class ConnectedState extends HookWidget with ProviderMixin {
  const ConnectedState();

  @override
  Widget build(BuildContext context) {
    final vm = getViewModel<DuelRoomViewModel>(context);
    final isDeckReady = useStream(useMemoized(() => vm.isDeckReady), initialData: false);

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _DropdownsBuilder(),
            if (isDeckReady.requireData) ...[
              const SizedBox(height: 32.0),
              const _CreateRoomButton(),
              const SizedBox(height: 24.0),
              const _EnterRoomTextField(),
              const SizedBox(height: AppSizes.screenMarginSmall),
              const _EnterRoomButton(),
            ],
          ],
        ),
      ),
    );
  }
}

class _DropdownsBuilder extends HookWidget with ProviderMixin {
  const _DropdownsBuilder();

  @override
  Widget build(BuildContext context) {
    final vm = getViewModel<DuelRoomViewModel>(context);

    final deckListState = useStream(
      useMemoized(() => vm.deckListState),
      initialData: const DeckListLoading(),
    );

    return deckListState.requireData.when(
      data: (decks, skillCards) => Column(
        children: [
          _Dropdown<Deck>(
            selectedItemStream: vm.selectedDeck,
            items: decks
                .map(
                  (deck) => DropdownMenuItem<Deck>(
                    value: deck,
                    child: Text(deck.name),
                  ),
                )
                .toList(),
            onItemSelected: vm.onDeckSelected,
            hint: 'Select a deck',
          ),
          const SizedBox(height: AppSizes.screenMarginSmall),
          _Dropdown<YugiohCard>(
            selectedItemStream: vm.selectedSkillCard,
            items: skillCards
                .map(
                  (skillCard) => DropdownMenuItem<YugiohCard>(
                    value: skillCard,
                    child: Text(skillCard.name),
                  ),
                )
                .toList(),
            onItemSelected: vm.onSkillcardSelected,
            hint: 'Select a skill card',
          ),
        ],
      ),
      loading: () => const LoadingIndicator(),
    );
  }
}

class _Dropdown<T> extends HookWidget with ProviderMixin {
  final Stream<T> selectedItemStream;
  final List<DropdownMenuItem<T>> items;
  final void Function(T? value) onItemSelected;
  final String hint;

  const _Dropdown({
    required this.selectedItemStream,
    required this.items,
    required this.onItemSelected,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final selectedItem = useStream(useMemoized(() => selectedItemStream));

    return DropdownButton<T>(
      items: items,
      value: selectedItem.data,
      isExpanded: true,
      hint: Text(hint),
      onChanged: onItemSelected,
      dropdownColor: AppColors.secondaryBackgroundColor,
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelRoomViewModel>(context);

    return IconTitleTileButton(
      icon: Icons.add_business,
      title: 'Create room',
      onPressed: vm.onCreateRoomPressed,
    );
  }
}

class _EnterRoomTextField extends StatelessWidget {
  const _EnterRoomTextField();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelRoomViewModel>(context);

    return TextFieldWithValidation(
      label: 'Room name',
      hint: 'K41B4',
      textStream: vm.roomName,
      onChanged: vm.onRoomNameChanged,
      onSubmitted: vm.onRoomNameSubmitted,
    );
  }
}

class _EnterRoomButton extends StatelessWidget {
  const _EnterRoomButton();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DuelRoomViewModel>(context);

    return IconTitleTileButton(
      icon: Icons.meeting_room,
      title: 'Enter room',
      onPressed: vm.onJoinRoomPressed,
    );
  }
}
