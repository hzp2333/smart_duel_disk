import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/core/core_localization/lib/core_localization.dart';

@LazySingleton()
class DuelFormValidators {
  static final _ipAddressRegex = RegExp(r'^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$');
  static final _portRegex = RegExp('[0-9]+');

  final StringProvider _stringProvider;

  DuelFormValidators(
    this._stringProvider,
  );

  StreamTransformer<String?, String?> get ipAddressValidator {
    return StreamTransformer<String?, String?>.fromHandlers(
      handleData: (ipAddress, sink) {
        if (ipAddress == null) {
          sink.add(null);
          return;
        }

        if (ipAddress.isEmpty) {
          sink.addError(_stringProvider.getString(LocaleKeys.duel_form_no_ip_address));
          return;
        }

        if (!isValidIpAddress(ipAddress)) {
          sink.addError(_stringProvider.getString(LocaleKeys.duel_form_invalid_ip_address));
          return;
        }

        sink.add(ipAddress);
      },
    );
  }

  StreamTransformer<String?, String?> get portValidator {
    return StreamTransformer<String?, String?>.fromHandlers(
      handleData: (port, sink) {
        if (port == null) {
          sink.add(null);
          return;
        }

        if (port.isEmpty) {
          sink.addError(_stringProvider.getString(LocaleKeys.duel_form_no_port));
          return;
        }

        if (!isValidPort(port)) {
          sink.addError(_stringProvider.getString(LocaleKeys.duel_form_invalid_port));
          return;
        }

        sink.add(port);
      },
    );
  }

  bool isValidIpAddress(String? ipAddress) {
    return ipAddress != null && _ipAddressRegex.hasMatch(ipAddress);
  }

  bool isValidPort(String? port) {
    return port != null && _portRegex.hasMatch(port);
  }
}
