import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

@immutable
class DeckState extends Equatable {
  final Iterable<UserDeck> decks;
  final bool loading;

  const DeckState({
    required this.decks,
    required this.loading,
  });

  DeckState copyWith({Iterable<UserDeck>? decks, bool? loading}) {
    return DeckState(
      decks: decks ?? this.decks,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
        decks,
        loading,
      ];

  @override
  bool? get stringify => true;
}
