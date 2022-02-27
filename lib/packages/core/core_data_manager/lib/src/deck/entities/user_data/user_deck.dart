import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_deck.g.dart';

@immutable
@JsonSerializable()
class UserDeck extends Equatable {
  final String name;
  final Iterable<int> cardIds;

  const UserDeck({
    required this.name,
    required this.cardIds,
  });

  @override
  List<Object?> get props => [
        name,
        cardIds,
      ];

  @override
  bool? get stringify => true;

  factory UserDeck.fromJson(Map<String, dynamic> json) => _$UserDeckFromJson(json);

  Map<String, dynamic> toJson() => _$UserDeckToJson(this);
}
