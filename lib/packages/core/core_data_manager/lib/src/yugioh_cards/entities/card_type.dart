enum CardType {
  spellCard,
  flipEffectMonster,
  trapCard,
  effectMonster,
  normalMonster,
  fusionMonster,
  skillCard,
  ritualMonster,
  unionEffectMonster,
  toonMonster,
  ritualEffectMonster,
  token,
  unknown,
}

CardType parseCardType(String value) {
  switch (value.toLowerCase()) {
    case 'spell card':
      return CardType.spellCard;
    case 'flip effect monster':
      return CardType.flipEffectMonster;
    case 'trap card':
      return CardType.trapCard;
    case 'effect monster':
      return CardType.effectMonster;
    case 'normal monster':
      return CardType.normalMonster;
    case 'fusion monster':
      return CardType.fusionMonster;
    case 'skill card':
      return CardType.skillCard;
    case 'ritual monster':
      return CardType.ritualMonster;
    case 'union effect monster':
      return CardType.unionEffectMonster;
    case 'toon monster':
      return CardType.toonMonster;
    case 'ritual effect monster':
      return CardType.ritualEffectMonster;
    case 'token':
      return CardType.token;
    default:
      return CardType.unknown;
  }
}
