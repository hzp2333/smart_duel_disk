import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/dialogs/base/models/speed_duel_dialog_action.dart';

import 'add_card_to_deck_dialog_result.dart';

abstract class AddCardToDeckDialogAction extends SpeedDuelDialogAction {
  const AddCardToDeckDialogAction({
    required String name,
    required IconData icon,
    required AddCardToDeckDialogResult result,
  }) : super(
          name: name,
          icon: icon,
          result: result,
        );
}

class AddToTopDialogAction extends AddCardToDeckDialogAction {
  const AddToTopDialogAction()
      : super(
          name: LocaleKeys.card_action_to_top_of_deck,
          icon: FontAwesomeIcons.arrowUp,
          result: const AddToTopOfDeck(),
        );
}

class AddToBottomDialogAction extends AddCardToDeckDialogAction {
  const AddToBottomDialogAction()
      : super(
          name: LocaleKeys.card_action_to_bottom_of_deck,
          icon: FontAwesomeIcons.arrowDown,
          result: const AddToBottomOfDeck(),
        );
}

class AddAndShuffleAction extends AddCardToDeckDialogAction {
  const AddAndShuffleAction()
      : super(
          name: LocaleKeys.card_action_add_to_deck_and_shuffle,
          icon: FontAwesomeIcons.random,
          result: const AddToDeckAndShuffle(),
        );
}
