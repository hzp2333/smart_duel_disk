import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

@immutable
abstract class DeckBuilderSection extends Equatable {
  final String titleId;
  final Iterable<CardCopy> cards;

  const DeckBuilderSection({
    required this.titleId,
    required this.cards,
  });

  @override
  List<Object?> get props => [
        titleId,
        cards,
      ];

  @override
  bool? get stringify => true;
}

class SkillCardSection extends DeckBuilderSection {
  const SkillCardSection({required Iterable<CardCopy> cards})
      : super(
          titleId: LocaleKeys.deck_builder_skill_cards_section,
          cards: cards,
        );
}

class MonsterCardsSection extends DeckBuilderSection {
  const MonsterCardsSection({required Iterable<CardCopy> cards})
      : super(
          titleId: LocaleKeys.deck_builder_monster_cards_section,
          cards: cards,
        );
}

class SpellCardsSection extends DeckBuilderSection {
  const SpellCardsSection({required Iterable<CardCopy> cards})
      : super(
          titleId: LocaleKeys.deck_builder_spell_cards_section,
          cards: cards,
        );
}

class TrapCardsSection extends DeckBuilderSection {
  const TrapCardsSection({required Iterable<CardCopy> cards})
      : super(
          titleId: LocaleKeys.deck_builder_trap_cards_section,
          cards: cards,
        );
}

class ExtraDeckSection extends DeckBuilderSection {
  const ExtraDeckSection({required Iterable<CardCopy> cards})
      : super(
          titleId: LocaleKeys.deck_builder_extra_deck_section,
          cards: cards,
        );
}
