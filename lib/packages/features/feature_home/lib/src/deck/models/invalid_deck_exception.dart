class InvalidDeckException implements Exception {
  final String reason;

  const InvalidDeckException({
    required this.reason,
  });

  @override
  String toString() => 'This deck is invalid. Reason: $reason';
}
