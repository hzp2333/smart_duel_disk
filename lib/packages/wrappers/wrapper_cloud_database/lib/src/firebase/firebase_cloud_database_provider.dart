import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

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
    final getDeckResponse = GetDeckResponse.fromJson(response.data());

    return getDeckResponse.cardIds;
  }
}
