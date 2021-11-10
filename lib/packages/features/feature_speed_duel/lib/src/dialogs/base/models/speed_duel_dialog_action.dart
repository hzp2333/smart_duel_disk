import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'speed_duel_dialog_result.dart';

@immutable
abstract class SpeedDuelDialogAction extends Equatable {
  final String name;
  final IconData icon;
  final SpeedDuelDialogResult result;

  const SpeedDuelDialogAction({
    required this.name,
    required this.icon,
    required this.result,
  });

  @override
  List<Object?> get props => [
        name,
        icon,
        result,
      ];

  @override
  bool? get stringify => true;
}
