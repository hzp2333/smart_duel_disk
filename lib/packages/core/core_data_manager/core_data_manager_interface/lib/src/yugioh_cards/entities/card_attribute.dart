enum CardAttribute {
  dark,
  earth,
  light,
  wind,
  water,
  fire,
  divine,
  unknown,
}

CardAttribute parseCardAttribute(String value) {
  switch (value.toLowerCase()) {
    case 'dark':
      return CardAttribute.dark;
    case 'earth':
      return CardAttribute.earth;
    case 'light':
      return CardAttribute.light;
    case 'wind':
      return CardAttribute.wind;
    case 'water':
      return CardAttribute.water;
    case 'fire':
      return CardAttribute.fire;
    case 'divine':
      return CardAttribute.divine;
    default:
      return CardAttribute.unknown;
  }
}
