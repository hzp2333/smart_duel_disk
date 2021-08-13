import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class ConnectionInfo extends Equatable {
  final String ipAddress;
  final String port;

  const ConnectionInfo({
    @required this.ipAddress,
    @required this.port,
  });

  @override
  List<Object> get props => [
        ipAddress,
        port,
      ];

  @override
  bool get stringify => true;
}
