import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_file_manager/lib/core_file_manager.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/deck/models/invalid_deck_exception.dart';

/// This use case is used to extract data from a .ydk (= Yu-Gi-Oh! Deck) file
/// and create a valid decklist if possible. Only the main and extra deck sections of the
/// data will be used, as the app currently doesn't support side decks.
/// Skill cards aren't stored in ydk files, so duelists will have to select
/// one before they start a duel.
@LazySingleton()
class GetCardIdsFromDeckFileUseCase {
  static const _mainDeckTag = '#main';
  static const _extraDeckTag = '#extra';
  static const _sideDeckTag = '!side';

  static const _mainDeckMinSize = 20;
  static const _mainDeckMaxSize = 30;

  static const _extraDeckMinSize = 0;
  static const _extraDeckMaxSize = 5;

  static const _maxCopiesOfCard = 3;

  final DataManager _dataManager;
  final FileManager _fileManager;
  final StringProvider _stringProvider;

  GetCardIdsFromDeckFileUseCase(
    this._dataManager,
    this._fileManager,
    this._stringProvider,
  );

  Future<Iterable<int>> call() async {
    final deckFile = await _fileManager.pickYugiohDeck();
    final deckFileData = await deckFile.readAsLines();

    final deckData = _extractDeckData(deckFileData);
    _verifyDeckSize(deckData);

    final cardIds = _getCardIds(deckData);
    await _verifySpeedDuelFormatCompliancy(cardIds);

    return cardIds;
  }

  Map<String, Iterable<String>> _extractDeckData(List<String> deckData) {
    if (!_isDeckFileDataValid(deckData)) {
      _cancelFlow(LocaleKeys.invalid_deck_reason_invalid_file);
    }

    final mainDeckTagIndex = deckData.indexOf(_mainDeckTag);
    final extraDeckTagIndex = deckData.indexOf(_extraDeckTag);
    final sideDeckTagIndex = deckData.indexOf(_sideDeckTag);

    return {
      _mainDeckTag: deckData.getRange(mainDeckTagIndex + 1, extraDeckTagIndex),
      _extraDeckTag: deckData.getRange(extraDeckTagIndex + 1, sideDeckTagIndex),
    };
  }

  bool _isDeckFileDataValid(Iterable<String> deckFileData) {
    return deckFileData.contains(_mainDeckTag) &&
        deckFileData.contains(_extraDeckTag) &&
        deckFileData.contains(_sideDeckTag);
  }

  void _verifyDeckSize(Map<String, Iterable<String>> deckData) {
    final mainDeck = deckData[_mainDeckTag]!;
    if (!_isDeckSizeValid(mainDeck, _mainDeckMinSize, _mainDeckMaxSize)) {
      _cancelFlow(
        LocaleKeys.invalid_deck_reason_main_deck_size,
        [_mainDeckMinSize.toString(), _mainDeckMaxSize.toString()],
      );
    }

    final extraDeck = deckData[_extraDeckTag]!;
    if (!_isDeckSizeValid(extraDeck, _extraDeckMinSize, _extraDeckMaxSize)) {
      _cancelFlow(
        LocaleKeys.invalid_deck_reason_extra_deck_size,
        [_extraDeckMinSize.toString(), _extraDeckMaxSize.toString()],
      );
    }
  }

  bool _isDeckSizeValid(Iterable<String> cardIds, int minSize, int maxSize) {
    return cardIds.length >= minSize && cardIds.length <= maxSize;
  }

  Iterable<int> _getCardIds(Map<String, Iterable<String>> deckData) {
    final mainDeck = deckData[_mainDeckTag]!;
    final extraDeck = deckData[_extraDeckTag]!;

    return [...mainDeck, ...extraDeck]
        .map((cardIdString) {
          final cardId = int.tryParse(cardIdString);
          if (cardId == null) {
            _cancelFlow(LocaleKeys.invalid_deck_reason_invalid_card_id, [cardIdString]);
          }

          return cardId;
        })
        .whereType<int>()
        .toList();
  }

  Future<void> _verifySpeedDuelFormatCompliancy(Iterable<int> cardIds) async {
    final speedDuelCards = await _dataManager.getSpeedDuelCards();
    final skillCardsIds = speedDuelCards.where((card) => card.type == CardType.skillCard).map((card) => card.id);
    final speedDuelCardIds = speedDuelCards.map((card) => card.id);

    for (final cardId in cardIds) {
      _verifyAmountOfCopies(cardIds, cardId);
      _verifyCardIsNotSkillCard(skillCardsIds, cardId);
      _verifyCardIsSpeedDuelCard(speedDuelCardIds, cardId);
    }
  }

  void _verifyAmountOfCopies(Iterable<int> cardIds, int cardId) {
    final amountOfCopies = cardIds.where((id) => id == cardId).length;
    if (amountOfCopies > _maxCopiesOfCard) {
      _cancelFlow(
        LocaleKeys.invalid_deck_reason_too_many_copies,
        [cardId.toString(), _maxCopiesOfCard.toString()],
      );
    }
  }

  void _verifyCardIsNotSkillCard(Iterable<int> skillCardIds, int cardId) {
    if (skillCardIds.contains(cardId)) {
      _cancelFlow(LocaleKeys.invalid_deck_reason_skill_card, [cardId.toString()]);
    }
  }

  void _verifyCardIsSpeedDuelCard(Iterable<int> speedDuelCardIds, int cardId) {
    if (!speedDuelCardIds.contains(cardId)) {
      _cancelFlow(LocaleKeys.invalid_deck_reason_not_speed_duel_card, [cardId.toString()]);
    }
  }

  void _cancelFlow(String reasonKey, [List<String>? args]) {
    throw InvalidDeckException(
      reason: _stringProvider.getString(reasonKey, args),
    );
  }
}
