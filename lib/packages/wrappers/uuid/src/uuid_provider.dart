import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

abstract class UuidProvider {
  String generateUuid();
}

@LazySingleton(as: UuidProvider)
class UuidProviderImpl implements UuidProvider {
  final Uuid _uuid;

  UuidProviderImpl(
    this._uuid,
  );

  @override
  String generateUuid() {
    return _uuid.v1();
  }
}
