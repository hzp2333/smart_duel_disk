import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_deck.dart';

part 'user_data.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class UserData extends Equatable {
  final Iterable<UserDeck> decks;

  const UserData({
    required this.decks,
  });

  factory UserData.create() {
    return const UserData(
      decks: [],
    );
  }

  UserData copyWith({Iterable<UserDeck>? decks}) {
    return UserData(
      decks: decks ?? this.decks,
    );
  }

  @override
  List<Object?> get props => [
        decks,
      ];

  @override
  bool? get stringify => true;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
