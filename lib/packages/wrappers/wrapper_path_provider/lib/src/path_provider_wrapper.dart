import 'package:injectable/injectable.dart';
import 'package:universal_io/io.dart';

import 'di/path_provider_module.dart';

abstract class PathProviderWrapper {
  Directory getApplicationDocumentsDirectory();
  Directory getTemporaryDirectory();
}

@LazySingleton(as: PathProviderWrapper)
class PathProviderWrapperImpl implements PathProviderWrapper {
  final Directory _appDocDirectory;
  final Directory _tempDirectory;

  PathProviderWrapperImpl(
    @Named(appDocDirectoryName) this._appDocDirectory,
    @Named(tempDirectoryName) this._tempDirectory,
  );

  @override
  Directory getApplicationDocumentsDirectory() => _appDocDirectory;

  @override
  Directory getTemporaryDirectory() => _tempDirectory;
}
