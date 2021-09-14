enum ZoneType {
  hand,
  field,
  mainMonster1,
  mainMonster2,
  mainMonster3,
  graveyard,
  banished,
  extraDeck,
  spellTrap1,
  spellTrap2,
  spellTrap3,
  deck,
}

ZoneType? parseZoneType(String? zoneType) {
  switch (zoneType) {
    case 'hand':
      return ZoneType.hand;
    case 'field':
      return ZoneType.field;
    case 'mainMonster1':
      return ZoneType.mainMonster1;
    case 'mainMonster2':
      return ZoneType.mainMonster2;
    case 'mainMonster3':
      return ZoneType.mainMonster3;
    case 'graveyard':
      return ZoneType.graveyard;
    case 'banished':
      return ZoneType.banished;
    case 'extraDeck':
      return ZoneType.extraDeck;
    case 'spellTrap1':
      return ZoneType.spellTrap1;
    case 'spellTrap2':
      return ZoneType.spellTrap2;
    case 'spellTrap3':
      return ZoneType.spellTrap3;
    case 'deck':
      return ZoneType.deck;
    default:
      return null;
  }
}

extension ZoneTypeExtensions on ZoneType {
  bool get isMainMonsterZone =>
      this == ZoneType.mainMonster1 || this == ZoneType.mainMonster2 || this == ZoneType.mainMonster3;

  bool get isSpellTrapCardZone =>
      this == ZoneType.spellTrap1 || this == ZoneType.spellTrap2 || this == ZoneType.spellTrap3;

  bool get isMultiCardZone => !isMainMonsterZone && !isSpellTrapCardZone && this != ZoneType.field;
}
