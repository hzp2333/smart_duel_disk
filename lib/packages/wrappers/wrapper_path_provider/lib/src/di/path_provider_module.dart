import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_duel_disk/src/di/di.dart';
import 'package:universal_io/io.dart';

const appDirectoryName = 'AppDirectory';
const tempDirectoryName = 'TempDirectoryName';

@module
abstract class PathProviderModule {
  @preResolve
  @Named(appDirectoryName)
  @LazySingleton(env: [mobileEnvName])
  Future<Directory> provideMobileAppDirectory() => getApplicationDocumentsDirectory();

  @preResolve
  @Named(tempDirectoryName)
  @LazySingleton(env: [mobileEnvName])
  Future<Directory> provideMobileTempDirectory() => getTemporaryDirectory();

  @preResolve
  @Named(appDirectoryName)
  @LazySingleton(env: [webEnvName])
  Future<Directory> provideWebAppDirectory() => Future.value(Directory.current);

  @preResolve
  @Named(tempDirectoryName)
  @LazySingleton(env: [webEnvName])
  Future<Directory> provideWebTempDirectory() => Future.value(Directory.current);
}
