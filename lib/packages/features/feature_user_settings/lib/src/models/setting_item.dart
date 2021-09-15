import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'user_setting_type.dart';

@immutable
class SettingItem extends Equatable {
  final String titleId;
  final IconData leadingIcon;
  final UserSettingType type;

  const SettingItem({
    required this.titleId,
    required this.leadingIcon,
    required this.type,
  });

  @override
  List<Object> get props => [
        titleId,
        leadingIcon,
        type,
      ];

  @override
  bool get stringify => true;
}

@immutable
class SwitchSettingItem extends SettingItem {
  final bool value;
  final FutureOr<void> Function(bool value) onValueChanged;

  const SwitchSettingItem({
    required String titleId,
    required IconData leadingIcon,
    required UserSettingType type,
    required this.value,
    required this.onValueChanged,
  }) : super(
          titleId: titleId,
          leadingIcon: leadingIcon,
          type: type,
        );

  @override
  List<Object> get props => [
        titleId,
        leadingIcon,
        type,
        value,
      ];

  @override
  bool get stringify => true;
}
