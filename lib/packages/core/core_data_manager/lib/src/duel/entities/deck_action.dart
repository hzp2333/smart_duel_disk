import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DeckAction extends Equatable {
  final String title;
  final IconData icon;

  const DeckAction({
    @required this.title,
    @required this.icon,
  });

  @override
  List<Object> get props => [title, icon];

  @override
  bool get stringify => true;
}

class DrawCard extends DeckAction {
  const DrawCard()
      : super(
          title: 'Draw card',
          icon: Icons.credit_card,
        );
}

class SummonToken extends DeckAction {
  const SummonToken()
      : super(
          title: 'Summon token',
          icon: Icons.adb,
        );
}

class ShowDeckList extends DeckAction {
  const ShowDeckList()
      : super(
          title: 'Show deck list',
          icon: Icons.view_carousel_rounded,
        );
}

class ShuffleDeck extends DeckAction {
  const ShuffleDeck()
      : super(
          title: 'Shuffle deck',
          icon: Icons.shuffle,
        );
}

class Surrender extends DeckAction {
  const Surrender()
      : super(
          title: 'Surrender',
          icon: Icons.flag,
        );
}
