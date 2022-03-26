import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@module
abstract class UuidModule {
  @LazySingleton()
  Uuid provideUuid() => const Uuid();
}
