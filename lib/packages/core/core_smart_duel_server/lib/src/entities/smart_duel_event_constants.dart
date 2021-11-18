abstract class SmartDuelEventConstants {
  //region Scopes

  static const globalScope = 'global';
  static const cardScope = 'card';
  static const roomScope = 'room';
  static const deckScope = 'deck';

  //endregion

  //region Actions

  static const globalConnectAction = 'connect';
  static const globalConnectErrorAction = 'connect_error';
  static const globalConnectTimeoutAction = 'connect_timeout';
  static const globalConnectingAction = 'connecting';
  static const globalDisconnectAction = 'disconnect';
  static const globalErrorAction = 'error';
  static const globalReconnectAction = 'reconnect';

  static const cardPlayAction = 'play';
  static const cardRemoveAction = 'remove';
  static const cardAttackAction = 'attack';
  static const cardDeclareAction = 'declare';
  static const cardAddCounterAction = 'add-counter';
  static const cardRemoveCounterAction = 'remove-counter';
  static const cardRevealAction = 'reveal';
  static const cardHideAction = 'hide';
  static const cardGiveToOpponentAction = 'give-to-opponent';

  static const roomCreateAction = 'create';
  static const roomCloseAction = 'close';
  static const roomJoinAction = 'join';
  static const roomStartAction = 'start';
  static const roomSurrenderAction = 'surrender';

  static const deckShuffleAction = 'shuffle';

  //endregion
}
