import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/authentication/authentication.dart' as auth_service;

import '../auth_provider.dart';

@LazySingleton(as: AuthProvider)
class FirebaseAuthProvider extends AuthProvider {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthProvider(
    this._firebaseAuth,
  );

  @override
  Stream<auth_service.User?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((user) {
      if (user == null) {
        return null;
      }

      return auth_service.User(
        displayName: user.displayName,
      );
    });
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
