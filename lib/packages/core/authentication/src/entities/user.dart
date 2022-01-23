import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class User extends Equatable {
  final String? displayName;

  const User({
    required this.displayName,
  });

  @override
  List<Object?> get props => [
        displayName,
      ];

  @override
  bool? get stringify => true;
}
