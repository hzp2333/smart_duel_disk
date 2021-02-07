import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class DialogConfig extends Equatable {
  final String title;
  final String description;
  final String positiveButton;
  final String negativeButton;
  final bool isDismissable;

  const DialogConfig({
    @required this.title,
    @required this.description,
    @required this.positiveButton,
    this.negativeButton,
    this.isDismissable = true,
  });

  @override
  List<Object> get props {
    return [
      title,
      description,
      positiveButton,
      negativeButton,
      isDismissable,
    ];
  }

  @override
  bool get stringify => true;
}
