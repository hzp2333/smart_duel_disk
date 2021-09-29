import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

const appDocDirectoryName = 'ApplicationDocumentsDirectory';
const tempDirectoryName = 'TemporaryDirectory';

@module
abstract class PathProviderModule {
  @preResolve
  @Named(appDocDirectoryName)
  @LazySingleton()
  Future<Directory> provideAppDocDirectory() => getApplicationDocumentsDirectory();

  @preResolve
  @Named(tempDirectoryName)
  @LazySingleton()
  Future<Directory> provideTempDirectory() => getApplicationDocumentsDirectory();
}
