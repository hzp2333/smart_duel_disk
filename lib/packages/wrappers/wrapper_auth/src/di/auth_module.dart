import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {
  @LazySingleton()
  FirebaseAuth provideFirebaseAuth() => FirebaseAuth.instance;
}
