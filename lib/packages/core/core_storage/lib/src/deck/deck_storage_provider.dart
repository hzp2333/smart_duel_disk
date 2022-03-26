import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_shared_preferences/lib/wrapper_shared_preferences.dart';

abstract class DeckStorageProvider {
  String? getLastSelectedDeckId();
  Future<void> setLastSelectedDeckId(String deckId);
  int? getLastSelectedSkillCardId();
  Future<void> setLastSelectedSkillCardId(int cardId);
}

@LazySingleton(as: DeckStorageProvider)
class DeckStorageProviderImpl implements DeckStorageProvider {
  static const _lastSelectedDeckIdKey = 'lastSelectedDeckId';
  static const _lastSelectedSkillCardIdKey = 'lastSelectedSkillCardId';

  final SharedPreferencesProvider _sharedPreferencesProvider;

  DeckStorageProviderImpl(
    this._sharedPreferencesProvider,
  );

  @override
  String? getLastSelectedDeckId() {
    return _sharedPreferencesProvider.getString(_lastSelectedDeckIdKey);
  }

  @override
  Future<void> setLastSelectedDeckId(String deckId) async {
    await _sharedPreferencesProvider.setString(_lastSelectedDeckIdKey, deckId);
  }

  @override
  int? getLastSelectedSkillCardId() {
    return _sharedPreferencesProvider.getInt(_lastSelectedSkillCardIdKey);
  }

  @override
  Future<void> setLastSelectedSkillCardId(int cardId) async {
    await _sharedPreferencesProvider.setInt(_lastSelectedSkillCardIdKey, cardId);
  }
}
