import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'duelist.g.dart';

@immutable
@JsonSerializable()
class Duelist extends Equatable {
  final String id;
  final Iterable<int> deckList;

  const Duelist({
    @required this.id,
    @required this.deckList,
  });

  @override
  List<Object> get props => [
        id,
        deckList,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() => _$DuelistToJson(this);
  factory Duelist.fromJson(Map<String, dynamic> json) => _$DuelistFromJson(json);
}
