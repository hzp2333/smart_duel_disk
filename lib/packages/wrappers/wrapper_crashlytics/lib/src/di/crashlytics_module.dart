import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CrashlyticsModule {
  @LazySingleton()
  FirebaseCrashlytics provideFirebaseCrashlytics() => FirebaseCrashlytics.instance;
}
