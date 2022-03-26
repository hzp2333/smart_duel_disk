import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_deck.g.dart';

@immutable
@JsonSerializable()
class UserDeck extends Equatable {
  final String id;
  final String name;
  final Iterable<int> cardIds;

  const UserDeck({
    required this.id,
    required this.name,
    required this.cardIds,
  });

  UserDeck copyWith({String? name}) {
    return UserDeck(
      id: id,
      name: name ?? this.name,
      cardIds: cardIds,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        cardIds,
      ];

  @override
  bool? get stringify => true;

  factory UserDeck.fromJson(Map<String, dynamic> json) => _$UserDeckFromJson(json);

  Map<String, dynamic> toJson() => _$UserDeckToJson(this);
}
