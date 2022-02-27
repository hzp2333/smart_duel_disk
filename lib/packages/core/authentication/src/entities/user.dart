import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class User extends Equatable {
  final String id;
  final String? displayName;

  const User({
    required this.id,
    required this.displayName,
  });

  @override
  List<Object?> get props => [
        id,
        displayName,
      ];

  @override
  bool? get stringify => true;
}
