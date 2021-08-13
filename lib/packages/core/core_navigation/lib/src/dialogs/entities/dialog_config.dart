import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class DialogConfig extends Equatable {
  final String title;
  final String description;
  final String positiveButtonText;
  final String negativeButtonText;
  final bool isDismissable;

  const DialogConfig({
    @required this.title,
    @required this.description,
    @required this.positiveButtonText,
    this.negativeButtonText,
    this.isDismissable = true,
  });

  @override
  List<Object> get props {
    return [
      title,
      description,
      positiveButtonText,
      negativeButtonText,
      isDismissable,
    ];
  }

  @override
  bool get stringify => true;
}
