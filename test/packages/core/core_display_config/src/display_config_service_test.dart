import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_duel_disk/packages/core/core_display_config/lib/src/display_config_service.dart';

import '../../../../testing/mocks/shared.mocks.dart';

void main() {
  late DisplayConfigService _service;

  late MockSystemChromeProvider _systemChrome;

  setUp(() {
    _systemChrome = MockSystemChromeProvider();

    _service = DisplayConfigServiceImpl(
      _systemChrome,
    );
  });

  group('When the default mode is used', () {
    test('then the portrait up orientation is used', () async {
      await _service.useDefaultMode();

      verify(_systemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])).called(1);
    });

    test('then the app bar and bottom nav bar are shown', () async {
      await _service.useDefaultMode();

      verify(
        _systemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [
            SystemUiOverlay.bottom,
            SystemUiOverlay.top,
          ],
        ),
      ).called(1);
    });
  });

  group('When the duel mode is used', () {
    test('then the landscape left orientation is used', () async {
      await _service.useDuelMode();

      verify(_systemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])).called(1);
    });

    test('then the app bar and bottom nav bar are hidden', () async {
      await _service.useDuelMode();

      verify(
        _systemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [],
        ),
      ).called(1);
    });
  });
}
