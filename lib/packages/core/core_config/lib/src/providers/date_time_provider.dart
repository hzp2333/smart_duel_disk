import 'package:injectable/injectable.dart';

abstract class DateTimeProvider {
  DateTime get currentUtcDateTime;
}

@LazySingleton(as: DateTimeProvider)
class DateTimeProviderImpl implements DateTimeProvider {
  @override
  DateTime get currentUtcDateTime => DateTime.now().toUtc();
}
