import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';

abstract class AuthProvider {
  Stream<User?> authStateChanges();
  Future<void> signOut();
}
