import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/lib/wrapper_enum_helper.dart';

import '../cloud_database_provider.dart';
import '../models/get_deck_response.dart';

@LazySingleton(as: CloudDatabaseProvider)
class FirebaseCloudDatabaseProvider extends CloudDatabaseProvider {
  final FirebaseFirestore _firebaseFirestore;
  final EnumHelper _enumHelper;

  FirebaseCloudDatabaseProvider(
    this._firebaseFirestore,
    this._enumHelper,
  );

  @override
  Future<Iterable<int>> getPreBuiltDeckCardIds(PreBuiltDeck deck) async {
    final deckName = _enumHelper.convertToString(deck).capitalizeFirstLetter();
    final response = await _firebaseFirestore.collection('pre_built_decks').doc(deckName).get();
    final getDeckResponse = GetDeckResponse.fromJson(response.data());

    return getDeckResponse.cardIds;
  }
}
