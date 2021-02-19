import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/core_data_manager_interface/lib/src/deck/entities/pre_built_deck.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_cloud_database/wrapper_cloud_database_interface/lib/wrapper_cloud_database_interface.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_enum_helper/wrapper_enum_helper_interface/lib/wrapper_enum_helper_interface.dart';

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
