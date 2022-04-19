import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

abstract class CloudDatabaseProvider {
  Future<Iterable<int>> getPreBuiltDeckCardIds(String deckId);
  Future<Iterable<int>> getSpeedDuelBanlist();
  Stream<UserData?> getUserData(String userId);
  Future<UserData?> getCurrentUserData(String userId);
  Future<void> updateUserData(String userId, UserData userData);
}
