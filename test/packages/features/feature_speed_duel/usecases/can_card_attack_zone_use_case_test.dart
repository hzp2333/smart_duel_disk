import 'package:flutter_test/flutter_test.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart';

void main() {
  CanCardAttackZoneUseCase _useCase;

  const _userId = '123';
  const _opponentId = '456';

  const _spellCard = PlayCard(
    yugiohCard: YugiohCard(
      id: 0,
      name: 'Spell',
      type: CardType.spellCard,
      description: 'A spell',
      race: CardRace.normal,
      imageSmallUrl: '',
      imageLargeUrl: '',
    ),
    duelistId: _userId,
    zoneType: ZoneType.hand,
    position: CardPosition.faceUp,
    copyNumber: 1,
    formattedRaceAndType: '',
  );

  const _monsterCard = PlayCard(
    yugiohCard: YugiohCard(
      id: 1,
      name: 'Monster',
      type: CardType.normalMonster,
      description: 'A monster',
      race: CardRace.machine,
      imageSmallUrl: '',
      imageLargeUrl: '',
    ),
    duelistId: _userId,
    zoneType: ZoneType.mainMonster1,
    position: CardPosition.faceUp,
    copyNumber: 1,
    formattedRaceAndType: '',
  );

  const _userMonsterZone = Zone(zoneType: ZoneType.mainMonster1, duelistId: _userId);

  const _opponentSpellTrapZone = Zone(zoneType: ZoneType.spellTrap1, duelistId: _opponentId);
  const _opponentMonsterZone = Zone(zoneType: ZoneType.mainMonster1, duelistId: _opponentId);
  const _opponentHandZone = Zone(zoneType: ZoneType.hand, duelistId: _opponentId);

  setUp(() {
    _useCase = CanCardAttackZoneUseCase();
  });

  group('When the use case is called', () {
    test('and the card initiating the attack is not a monster, then false is returned', () {
      final result = _useCase(_spellCard, _opponentMonsterZone, _userId);

      expect(result, false);
    });

    test('and the card initiating the attack is not in a main monster zone, then false is returned', () {
      final monsterInHand = _monsterCard.copyWith(zoneType: ZoneType.hand);

      final result = _useCase(monsterInHand, _opponentMonsterZone, _userId);

      expect(result, false);
    });

    test('and the targetted zone does not belong to an opponent, then false is returned', () {
      final result = _useCase(_monsterCard, _userMonsterZone, _userId);

      expect(result, false);
    });

    test('and the targetted zone is the hand zone of the opponent, then true is returned', () {
      final result = _useCase(_monsterCard, _opponentHandZone, _userId);

      expect(result, true);
    });

    test('and the targetted zone is not a monster zone of an opponent, then false is returned', () {
      final result = _useCase(_monsterCard, _opponentSpellTrapZone, _userId);

      expect(result, false);
    });

    test('and there is not a monster in the targetted zone of the opponent, then false is returned', () {
      final result = _useCase(_monsterCard, _opponentMonsterZone, _userId);

      expect(result, false);
    });

    test('and there is a monster in the targetted zone of the opponent, then true is returned', () {
      final targettedZone = _opponentMonsterZone.copyWith(cards: [_monsterCard]);

      final result = _useCase(_monsterCard, targettedZone, _userId);

      expect(result, true);
    });
  });
}
