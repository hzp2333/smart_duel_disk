import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

// ignore: unused_import
import 'stubs/platform_provider_stub.dart'
    if (dart.library.io) 'package:path_provider/path_provider.dart'
    if (dart.library.html) 'stubs/platform_provider_stub.dart';

abstract class PathProviderWrapper {
  Future<Directory?> getAppDirectory();
  Future<Directory?> getTempDirectory();
}

@LazySingleton(as: PathProviderWrapper)
class PathProviderWrapperImpl implements PathProviderWrapper {
  @override
  Future<Directory?> getAppDirectory() => getApplicationDocumentsDirectory();

  @override
  Future<Directory?> getTempDirectory() => getTemporaryDirectory();
}
