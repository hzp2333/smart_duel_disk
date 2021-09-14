import 'package:flutter_test/flutter_test.dart';
import 'package:smart_duel_disk/generated/assets.gen.dart';
import 'package:smart_duel_disk/packages/core/core_data_manager/lib/core_data_manager_interface.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/card_position.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/play_card.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/models/zone_type.dart';
import 'package:smart_duel_disk/packages/features/feature_speed_duel/lib/src/usecases/can_card_attack_zone_use_case.dart';

void main() {
  late CanCardAttackZoneUseCase _useCase;

  const _userId = '123';
  const _opponentId = '456';

  final _spellCard = PlayCard(
    yugiohCard: const YugiohCard(
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
    attributeAssetName: Assets.icons.icCardTypeSpell.path,
  );

  final _monsterCard = PlayCard(
    yugiohCard: const YugiohCard(
      id: 1,
      name: 'Monster',
      type: CardType.normalMonster,
      description: 'A monster',
      race: CardRace.machine,
      imageSmallUrl: '',
      imageLargeUrl: '',
      attribute: CardAttribute.dark,
    ),
    duelistId: _userId,
    zoneType: ZoneType.mainMonster1,
    position: CardPosition.faceUp,
    copyNumber: 1,
    formattedRaceAndType: '',
    attributeAssetName: Assets.icons.icAttributeDark.path,
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
      final bool result = _useCase(_spellCard, _opponentMonsterZone, _userId);

      expect(result, false);
    });

    test('and the card initiating the attack is not in face-up attack position, then false is returned', () {
      final monsterInDefence = _monsterCard.copyWith(position: CardPosition.faceUpDefence);

      final bool result = _useCase(monsterInDefence, _opponentMonsterZone, _userId);

      expect(result, false);
    });

    test('and the card initiating the attack is not in a main monster zone, then false is returned', () {
      final monsterInHand = _monsterCard.copyWith(zoneType: ZoneType.hand);

      final bool result = _useCase(monsterInHand, _opponentMonsterZone, _userId);

      expect(result, false);
    });

    test('and the targetted zone does not belong to an opponent, then false is returned', () {
      final bool result = _useCase(_monsterCard, _userMonsterZone, _userId);

      expect(result, false);
    });

    test('and the targetted zone is the hand zone of the opponent, then true is returned', () {
      final bool result = _useCase(_monsterCard, _opponentHandZone, _userId);

      expect(result, true);
    });

    test('and the targetted zone is not a monster zone of an opponent, then false is returned', () {
      final bool result = _useCase(_monsterCard, _opponentSpellTrapZone, _userId);

      expect(result, false);
    });

    test('and there is not a monster in the targetted zone of the opponent, then false is returned', () {
      final bool result = _useCase(_monsterCard, _opponentMonsterZone, _userId);

      expect(result, false);
    });

    test('and there is a monster in the targetted zone of the opponent, then true is returned', () {
      final targettedZone = _opponentMonsterZone.copyWith(cards: [_monsterCard]);

      final bool result = _useCase(_monsterCard, targettedZone, _userId);

      expect(result, true);
    });
  });
}
