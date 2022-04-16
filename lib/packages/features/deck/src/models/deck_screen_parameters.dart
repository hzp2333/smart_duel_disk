import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class DeckScreenParameters extends Equatable {
  final bool isDetailScreen;

  const DeckScreenParameters({
    required this.isDetailScreen,
  });

  @override
  List<Object?> get props => [
        isDetailScreen,
      ];

  @override
  bool? get stringify => true;
}
