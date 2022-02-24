import 'package:equatable/equatable.dart';

class InvalidDeckException extends Equatable implements Exception {
  final String reason;

  const InvalidDeckException({
    required this.reason,
  });

  @override
  List<Object?> get props => [
        reason,
      ];

  @override
  bool? get stringify => true;
}
