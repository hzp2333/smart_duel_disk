import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

@immutable
class DeckBuilderScreenParameters extends Equatable {
  final PreBuiltDeck? preBuiltDeck;
  final UserDeck? userDeck;
  final CardType? initialCardTypeFilter;

  const DeckBuilderScreenParameters({
    this.preBuiltDeck,
    this.userDeck,
    this.initialCardTypeFilter,
  });

  @override
  List<Object?> get props => [
        preBuiltDeck,
        userDeck,
        initialCardTypeFilter,
      ];

  @override
  bool? get stringify => true;
}
