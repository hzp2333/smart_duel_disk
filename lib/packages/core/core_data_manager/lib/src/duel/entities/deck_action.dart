import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';

@immutable
abstract class DeckAction extends Equatable {
  final String titleId;
  final IconData icon;

  const DeckAction({
    required this.titleId,
    required this.icon,
  });

  @override
  List<Object> get props => [
        titleId,
        icon,
      ];

  @override
  bool get stringify => true;
}

class DrawCard extends DeckAction {
  const DrawCard()
      : super(
          titleId: LocaleKeys.deck_action_draw_card,
          icon: Icons.credit_card,
        );
}

class SummonToken extends DeckAction {
  const SummonToken()
      : super(
          titleId: LocaleKeys.deck_action_summon_token,
          icon: Icons.adb,
        );
}

class ShowDeckList extends DeckAction {
  const ShowDeckList()
      : super(
          titleId: LocaleKeys.deck_action_show_deck_list,
          icon: Icons.view_carousel_rounded,
        );
}

class ShuffleDeck extends DeckAction {
  const ShuffleDeck()
      : super(
          titleId: LocaleKeys.deck_action_shuffle_deck,
          icon: Icons.shuffle,
        );
}

class Surrender extends DeckAction {
  const Surrender()
      : super(
          titleId: LocaleKeys.deck_action_surrender,
          icon: Icons.flag,
        );
}
