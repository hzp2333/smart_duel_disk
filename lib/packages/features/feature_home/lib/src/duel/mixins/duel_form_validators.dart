import 'dart:async';

import 'package:injectable/injectable.dart';

@LazySingleton()
class DuelFormValidators {
  static final _ipAddressRegex = RegExp(r'^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$');
  static final _portRegex = RegExp('[0-9]+');

  StreamTransformer<String, String> get ipAddressValidator {
    return StreamTransformer<String, String>.fromHandlers(
      handleData: (ipAddress, sink) {
        if (ipAddress == null) {
          sink.add(null);
          return;
        }

        if (ipAddress.isEmpty) {
          sink.addError('IP address is required.');
          return;
        }

        if (!isValidIpAddress(ipAddress)) {
          sink.addError('Not a valid IP address.');
          return;
        }

        sink.add(ipAddress);
      },
    );
  }

  StreamTransformer<String, String> get portValidator {
    return StreamTransformer<String, String>.fromHandlers(
      handleData: (port, sink) {
        if (port == null) {
          sink.add(null);
          return;
        }

        if (port.isEmpty) {
          sink.addError('Port is required.');
          return;
        }

        if (!isValidPort(port)) {
          sink.addError('Not a valid port.');
          return;
        }

        sink.add(port);
      },
    );
  }

  bool isValidIpAddress(String ipAddress) {
    return ipAddress != null && _ipAddressRegex.hasMatch(ipAddress);
  }

  bool isValidPort(String port) {
    return port != null && _portRegex.hasMatch(port);
  }
}
