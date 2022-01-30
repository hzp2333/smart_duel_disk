import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SettingItem<T> extends Equatable {
  final T type;
  final String titleId;
  final IconData leadingIcon;
  final IconData? trailingIcon;

  const SettingItem({
    required this.type,
    required this.titleId,
    required this.leadingIcon,
    this.trailingIcon,
  });

  @override
  List<Object?> get props => [
        type,
        titleId,
        leadingIcon,
        trailingIcon,
      ];

  @override
  bool get stringify => true;
}

class ActionSettingItem<T> extends SettingItem<T> {
  final FutureOr<void> Function() onPressed;

  const ActionSettingItem({
    required String titleId,
    required IconData leadingIcon,
    required T type,
    IconData? trailingIcon,
    required this.onPressed,
  }) : super(
          titleId: titleId,
          leadingIcon: leadingIcon,
          type: type,
          trailingIcon: trailingIcon,
        );
}

class SwitchSettingItem<T> extends SettingItem<T> {
  final bool value;
  final FutureOr<void> Function(bool value) onValueChanged;

  const SwitchSettingItem({
    required String titleId,
    required IconData leadingIcon,
    required T type,
    IconData? trailingIcon,
    required this.value,
    required this.onValueChanged,
  }) : super(
          titleId: titleId,
          leadingIcon: leadingIcon,
          type: type,
          trailingIcon: trailingIcon,
        );

  @override
  List<Object?> get props => [
        ...props,
        value,
      ];
}

class SliderSettingItem<T> extends SettingItem<T> {
  final Stream<double> valueStream;
  final FutureOr<void> Function(double value) onValueChanged;

  const SliderSettingItem({
    required String titleId,
    required IconData leadingIcon,
    required T type,
    required IconData trailingIcon,
    required this.valueStream,
    required this.onValueChanged,
  }) : super(
          titleId: titleId,
          leadingIcon: leadingIcon,
          type: type,
          trailingIcon: trailingIcon,
        );
}
