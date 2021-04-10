enum CardPosition {
  faceUp,
  faceDown,
  faceUpDefence,
  faceDownDefence,
  destroy,
}

extension CardPositionExtensions on CardPosition {
  bool get isAttack => this == CardPosition.faceUp || this == CardPosition.faceDown;
  bool get isDefence => this == CardPosition.faceUpDefence || this == CardPosition.faceDownDefence;
  bool get isFaceUp => this == CardPosition.faceUp || this == CardPosition.faceUpDefence;
  bool get isFaceDown => this == CardPosition.faceDown || this == CardPosition.faceDownDefence;
}
