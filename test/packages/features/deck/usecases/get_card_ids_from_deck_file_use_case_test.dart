import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/deck/src/models/invalid_deck_exception.dart';
import 'package:smart_duel_disk/packages/features/deck/src/usecases/get_card_ids_from_deck_file_use_case.dart';

import '../../../../testing/mocks/shared.mocks.dart';

void main() {
  late GetCardIdsFromDeckFileUseCase _useCase;

  late MockDataManager _dataManager;
  late MockFileManager _fileManager;
  late MockStringProvider _stringProvider;

  late MockFile _file;

  const _mainDeckTag = '#main';
  const _extraDeckTag = '#extra';
  const _sideDeckTag = '!side';

  const _validMainDeck = [
    '10000000',
    '75347539',
    '77585513',
    '84636823',
    '39256679',
    '39256679',
    '39256679',
    '12262393',
    '12262393',
    '12262393',
    '99785935',
    '11549357',
    '11549357',
    '13945283',
    '13945283',
    '14087893',
    '14087893',
    '04740489',
    '04740489',
    '04740489',
    '26412047',
    '83715234',
    '71044499',
    '68005187',
    '14315573',
    '14315573',
    '83133491',
  ];

  const _validExtraDeck = [
    '91998119',
    '25119460',
    '99724761',
    '02111707',
  ];

  const _validDeckData = [
    _mainDeckTag,
    ..._validMainDeck,
    _extraDeckTag,
    ..._validExtraDeck,
    _sideDeckTag,
  ];

  const _skillCardId = '123';
  const _skillCard = YugiohCard(
    id: 123,
    name: 'Skillz',
    type: CardType.skillCard,
    description: '',
    race: CardRace.setoKaiba,
    imageSmallUrl: '',
    imageLargeUrl: '',
  );

  const _nonSpeedDuelCardId = '11738489';

  final _speedDuelCards = [
    _skillCard,
    ...[..._validMainDeck, ..._validExtraDeck].map(
      (cardId) => YugiohCard(
        id: int.parse(cardId),
        name: '',
        type: CardType.normalMonster,
        description: '',
        race: CardRace.beastWarrior,
        imageSmallUrl: '',
        imageLargeUrl: '',
      ),
    ),
  ];

  setUp(() {
    _file = MockFile();

    when(_file.readAsLines()).thenAnswer((_) => Future.value(_validDeckData));

    _dataManager = MockDataManager();
    _fileManager = MockFileManager();
    _stringProvider = MockStringProvider();

    when(_dataManager.getSpeedDuelCards()).thenAnswer((_) => Future.value(_speedDuelCards));

    when(_fileManager.pickYugiohDeck()).thenAnswer((_) => Future.value(_file));

    when(_stringProvider.getString(any, any))
        .thenAnswer((realInvocation) => realInvocation.positionalArguments.join(' - '));

    _useCase = GetCardIdsFromDeckFileUseCase(
      _dataManager,
      _fileManager,
      _stringProvider,
    );
  });

  group(
    'When the use case is called',
    () {
      test('then a yugioh deck is picked', () async {
        await _useCase();

        verify(_fileManager.pickYugiohDeck()).called(1);
      });

      test('then the lines of the picked file are read', () async {
        await _useCase();

        verify(_file.readAsLines()).called(1);
      });

      group('and there is no main deck tag', () {
        setUp(() {
          when(_file.readAsLines()).thenAnswer((_) => Future.value([]));
        });

        test('then the flow is cancelled', () {
          expect(
            _useCase(),
            throwsA(const InvalidDeckException(reason: 'invalid_deck_reason_invalid_file - null')),
          );
        });
      });

      group('and there is no extra deck tag', () {
        setUp(() {
          when(_file.readAsLines()).thenAnswer(
            (_) => Future.value([
              _mainDeckTag,
            ]),
          );
        });

        test('then the flow is cancelled', () {
          expect(
            _useCase(),
            throwsA(const InvalidDeckException(reason: 'invalid_deck_reason_invalid_file - null')),
          );
        });
      });

      group('and there is no side deck tag', () {
        setUp(() {
          when(_file.readAsLines()).thenAnswer(
            (_) => Future.value([
              _mainDeckTag,
              _extraDeckTag,
            ]),
          );
        });

        test('then the flow is cancelled', () {
          expect(
            _useCase(),
            throwsA(const InvalidDeckException(reason: 'invalid_deck_reason_invalid_file - null')),
          );
        });
      });

      group('and there are not enough cards in the main deck', () {
        setUp(() {
          when(_file.readAsLines()).thenAnswer(
            (_) => Future.value([
              _mainDeckTag,
              _extraDeckTag,
              _sideDeckTag,
            ]),
          );
        });

        test('then the flow is cancelled', () {
          expect(
            _useCase(),
            throwsA(const InvalidDeckException(reason: 'invalid_deck_reason_main_deck_size - [20, 30]')),
          );
        });
      });

      group('and there are too many cards in the main deck', () {
        setUp(() {
          when(_file.readAsLines()).thenAnswer(
            (_) => Future.value([
              _mainDeckTag,
              ..._validMainDeck,
              ..._validMainDeck,
              ..._validMainDeck,
              _extraDeckTag,
              ..._validExtraDeck,
              _sideDeckTag,
            ]),
          );
        });

        test('then the flow is cancelled', () {
          expect(
            _useCase(),
            throwsA(const InvalidDeckException(reason: 'invalid_deck_reason_main_deck_size - [20, 30]')),
          );
        });
      });

      group('and there are too many cards in the extra deck', () {
        setUp(() {
          when(_file.readAsLines()).thenAnswer(
            (_) => Future.value([
              _mainDeckTag,
              ..._validMainDeck,
              _extraDeckTag,
              ..._validExtraDeck,
              ..._validExtraDeck,
              ..._validExtraDeck,
              _sideDeckTag,
            ]),
          );
        });

        test('then the flow is cancelled', () {
          expect(
            _useCase(),
            throwsA(const InvalidDeckException(reason: 'invalid_deck_reason_extra_deck_size - [0, 5]')),
          );
        });
      });

      group('and there is an invalid card id', () {
        setUp(() {
          when(_file.readAsLines()).thenAnswer(
            (_) => Future.value([
              _mainDeckTag,
              'notAValidCardId',
              ..._validMainDeck,
              _extraDeckTag,
              ..._validExtraDeck,
              _sideDeckTag,
            ]),
          );
        });

        test('then the flow is cancelled', () {
          expect(
            _useCase(),
            throwsA(const InvalidDeckException(reason: 'invalid_deck_reason_invalid_card_id - [notAValidCardId]')),
          );
        });
      });

      group('and there are more than 3 copies of the same card in the deck', () {
        setUp(() {
          when(_file.readAsLines()).thenAnswer(
            (_) => Future.value([
              _mainDeckTag,
              '10000000',
              '10000000',
              '10000000',
              '10000000',
              ..._validMainDeck.getRange(0, 20),
              _extraDeckTag,
              ..._validExtraDeck,
              _sideDeckTag,
            ]),
          );
        });

        test('then the flow is cancelled', () {
          expect(
            _useCase(),
            throwsA(const InvalidDeckException(reason: 'invalid_deck_reason_too_many_copies - [10000000, 3]')),
          );
        });
      });

      group('and there is a skill card in the deck', () {
        setUp(() {
          when(_file.readAsLines()).thenAnswer(
            (_) => Future.value([
              _mainDeckTag,
              _skillCardId,
              ..._validMainDeck.getRange(0, 20),
              _extraDeckTag,
              ..._validExtraDeck,
              _sideDeckTag,
            ]),
          );
        });

        test('then the flow is cancelled', () {
          expect(
            _useCase(),
            throwsA(const InvalidDeckException(reason: 'invalid_deck_reason_skill_card - [$_skillCardId]')),
          );
        });
      });

      group('and there is a non-speed duel card in the deck', () {
        setUp(() {
          when(_file.readAsLines()).thenAnswer(
            (_) => Future.value([
              _mainDeckTag,
              _nonSpeedDuelCardId,
              ..._validMainDeck.getRange(0, 20),
              _extraDeckTag,
              ..._validExtraDeck,
              _sideDeckTag,
            ]),
          );
        });

        test('then the flow is cancelled', () {
          expect(
            _useCase(),
            throwsA(
              const InvalidDeckException(reason: 'invalid_deck_reason_not_speed_duel_card - [$_nonSpeedDuelCardId]'),
            ),
          );
        });
      });

      group('and the deck is compliant to the speed duel format', () {
        test('then the extracted list of card ids is returned', () async {
          final expected = [..._validMainDeck, ..._validExtraDeck].map((cardId) => int.parse(cardId));

          final result = await _useCase();

          expect(result, expected);
        });
      });
    },
  );
}
