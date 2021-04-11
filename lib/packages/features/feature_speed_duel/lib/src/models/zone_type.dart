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

extension ZoneTypeExtensions on ZoneType {
  bool get isMainMonsterZone =>
      this == ZoneType.mainMonster1 || this == ZoneType.mainMonster2 || this == ZoneType.mainMonster3;

  bool get isSpellTrapCardZone =>
      this == ZoneType.spellTrap1 || this == ZoneType.spellTrap2 || this == ZoneType.spellTrap3;

  bool get isMultiCardZone => !isMainMonsterZone && !isSpellTrapCardZone && this != ZoneType.field;
}
