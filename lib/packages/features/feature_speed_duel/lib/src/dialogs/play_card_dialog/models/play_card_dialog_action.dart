import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'play_card_dialog_action_type.dart';

@immutable
class PlayCardDialogAction extends Equatable {
  final String name;
  final IconData icon;
  final PlayCardDialogActionType type;

  const PlayCardDialogAction({
    @required this.name,
    @required this.icon,
    @required this.type,
  });

  @override
  List<Object> get props => [
        name,
        icon,
        type,
      ];

  @override
  bool get stringify => true;
}
