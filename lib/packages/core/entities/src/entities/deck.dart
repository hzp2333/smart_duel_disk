import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Deck extends Equatable {
  final String id;
  final String name;
  final Iterable<int> cardIds;

  const Deck({
    required this.id,
    required this.name,
    required this.cardIds,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        cardIds,
      ];

  @override
  bool? get stringify => true;
}
