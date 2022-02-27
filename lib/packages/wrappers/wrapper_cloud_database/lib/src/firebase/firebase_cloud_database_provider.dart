import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';

import '../cloud_database_provider.dart';
import '../models/get_deck_response.dart';

@LazySingleton(as: CloudDatabaseProvider)
class FirebaseCloudDatabaseProvider extends CloudDatabaseProvider {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseCloudDatabaseProvider(
    this._firebaseFirestore,
  );

  @override
  Future<Iterable<int>> getPreBuiltDeckCardIds(String deckId) async {
    final response = await _firebaseFirestore.collection('pre_built_decks').doc(deckId).get();
    final getDeckResponse = GetDeckResponse.fromJson(response.data()!);

    return getDeckResponse.cardIds;
  }

  @override
  Stream<UserData?> getUserData(String userId) {
    return _getUserRef().doc(userId).snapshots().map((userDoc) => userDoc.data());
  }

  @override
  Future<UserData?> getCurrentUserData(String userId) async {
    final userDoc = await _getUserRef().doc(userId).get();
    return userDoc.data();
  }

  @override
  Future<void> updateUserData(String userId, UserData userData) async {
    await _getUserRef().doc(userId).set(userData);
  }

  CollectionReference<UserData> _getUserRef() {
    return _firebaseFirestore.collection('users').withConverter<UserData>(
          fromFirestore: (snapshot, _) => UserData.fromJson(snapshot.data()!),
          toFirestore: (userData, options) => userData.toJson(),
        );
  }
}
