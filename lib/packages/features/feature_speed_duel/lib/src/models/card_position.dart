enum CardPosition {
  faceUp,
  faceDown,
  faceUpDefence,
  faceDownDefence,
  destroy,
}

CardPosition parseCardPosition(String cardPosition) {
  switch (cardPosition) {
    case 'faceUp':
      return CardPosition.faceUp;
    case 'faceDown':
      return CardPosition.faceDown;
    case 'faceUpDefence':
      return CardPosition.faceUpDefence;
    case 'faceDownDefence':
      return CardPosition.faceDownDefence;
    case 'destroy':
      return CardPosition.destroy;
    default:
      return null;
  }
}

extension CardPositionExtensions on CardPosition {
  bool get isAttack => this == CardPosition.faceUp || this == CardPosition.faceDown;
  bool get isDefence => this == CardPosition.faceUpDefence || this == CardPosition.faceDownDefence;
  bool get isFaceUp => this == CardPosition.faceUp || this == CardPosition.faceUpDefence;
  bool get isFaceDown => this == CardPosition.faceDown || this == CardPosition.faceDownDefence;
}
