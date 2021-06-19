abstract class SmartDuelEventConstants {
  //region Scopes

  static const globalScope = 'global';
  static const cardScope = 'card';
  static const roomScope = 'room';

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

  static const roomCreateAction = 'create';
  static const roomCloseAction = 'close';
  static const roomJoinAction = 'join';
  static const roomStartAction = 'start';

  //endregion
}
