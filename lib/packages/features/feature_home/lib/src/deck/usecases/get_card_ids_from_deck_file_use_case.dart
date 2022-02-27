import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/core/core_file_manager/lib/core_file_manager.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';
import 'package:smart_duel_disk/packages/core/core_logger/lib/core_logger.dart';
import 'package:smart_duel_disk/packages/features/feature_home/lib/src/deck/models/invalid_deck_exception.dart';

/// This use case is used to extract data from a .ydk (= Yu-Gi-Oh! Deck) file
/// and create a valid decklist if possible. Only the main and extra deck sections of the
/// data will be used, as the app currently doesn't support side decks.
/// Skill cards aren't stored in ydk files, so duelists will have to select
/// one before they start a duel.
@LazySingleton()
class GetCardIdsFromDeckFileUseCase {
  static const _tag = 'GetCardIdsFromDeckFileUseCase';

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
  final Logger _logger;

  GetCardIdsFromDeckFileUseCase(
    this._dataManager,
    this._fileManager,
    this._stringProvider,
    this._logger,
  );

  Future<Iterable<int>> call() async {
    final deckFile = await _fileManager.pickYugiohDeck();

    final deckData = await deckFile.readAsLines();
    final cardIds = _extractAndValidateCardIds(deckData);

    await _verifySpeedDuelFormatCompliancy(cardIds);

    return cardIds;
  }

  //region Card id extraction

  Iterable<int> _extractAndValidateCardIds(List<String> deckData) {
    if (!_isDeckDataValid(deckData)) {
      _cancelFlow(LocaleKeys.invalid_deck_reason_invalid_file);
    }

    final mainDeckTagIndex = deckData.indexOf(_mainDeckTag);
    final extraDeckTagIndex = deckData.indexOf(_extraDeckTag);
    final sideDeckTagIndex = deckData.indexOf(_sideDeckTag);

    final mainDeckCardIds = deckData.getRange(mainDeckTagIndex + 1, extraDeckTagIndex);
    if (!_isDeckSizeValid(mainDeckCardIds, _mainDeckMinSize, _mainDeckMaxSize)) {
      _cancelFlow(
        LocaleKeys.invalid_deck_reason_main_deck_size,
        [_mainDeckMinSize.toString(), _mainDeckMaxSize.toString()],
      );
    }

    final extraDeckCardIds = deckData.getRange(extraDeckTagIndex + 1, sideDeckTagIndex);
    if (!_isDeckSizeValid(extraDeckCardIds, _extraDeckMinSize, _extraDeckMaxSize)) {
      _cancelFlow(
        LocaleKeys.invalid_deck_reason_extra_deck_size,
        [_extraDeckMinSize.toString(), _extraDeckMaxSize.toString()],
      );
    }

    final cardIds = [...mainDeckCardIds, ...extraDeckCardIds].map((cardIdString) {
      final cardId = int.tryParse(cardIdString);
      if (cardId == null) {
        _cancelFlow(LocaleKeys.invalid_deck_reason_invalid_card_id, [cardIdString]);
      }

      return cardId;
    }).whereType<int>();

    return cardIds;
  }

  bool _isDeckDataValid(Iterable<String> deckData) {
    return deckData.contains(_mainDeckTag) && deckData.contains(_extraDeckTag) && deckData.contains(_sideDeckTag);
  }

  bool _isDeckSizeValid(Iterable<String> cardIds, int minSize, int maxSize) {
    return cardIds.length >= minSize && cardIds.length <= maxSize;
  }

  //endregion

  //region Speed Duel format compliancy verification

  Future<void> _verifySpeedDuelFormatCompliancy(Iterable<int> cardIds) async {
    final speedDuelCards = await _dataManager.getSpeedDuelCards();
    final skillCardsIds = speedDuelCards.where((card) => card.type == CardType.skillCard).map((card) => card.id);
    final speedDuelCardIds = speedDuelCards.map((card) => card.id);

    _logger.debug(_tag, 'Start verification');

    for (final cardId in cardIds) {
      _verifyAmountOfCopies(cardIds, cardId);
      _verifyCardIsNotSkillCard(skillCardsIds, cardId);
      _verifyCardIsSpeedDuelCard(speedDuelCardIds, cardId);
    }

    _logger.debug(_tag, 'Verification done');
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

  void _verifyCardIsNotSkillCard(Iterable<int> skillCards, int cardId) {
    if (skillCards.contains(cardId)) {
      _cancelFlow(LocaleKeys.invalid_deck_reason_skill_card, [cardId.toString()]);
    }
  }

  void _verifyCardIsSpeedDuelCard(Iterable<int> speedDuelCards, int cardId) {
    if (!speedDuelCards.contains(cardId)) {
      _cancelFlow(LocaleKeys.invalid_deck_reason_not_speed_duel_card, [cardId.toString()]);
    }
  }

  //endregion

  void _cancelFlow(String reasonKey, [List<String>? args]) {
    throw InvalidDeckException(
      reason: _stringProvider.getString(reasonKey, args),
    );
  }
}
