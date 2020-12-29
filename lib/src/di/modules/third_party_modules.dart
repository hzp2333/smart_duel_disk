import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @LazySingleton()
  FirebaseCrashlytics provideFirebaseCrashlytics() {
    return FirebaseCrashlytics.instance;
  }
}
