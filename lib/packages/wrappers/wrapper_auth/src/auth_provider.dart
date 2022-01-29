import 'package:smart_duel_disk/packages/core/authentication/authentication.dart';

abstract class AuthProvider {
  Stream<User?> userChanges();
  Future<void> signOut();
  Future<void> updateUsername(String username);
}
