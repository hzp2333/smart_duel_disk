import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_duel_disk/packages/wrappers/wrapper_system_chrome/lib/src/system_chrome_provider.dart';

abstract class DisplayConfigService {
  Future<void> useDefaultMode();
  Future<void> useDuelMode();
}

@LazySingleton(as: DisplayConfigService)
class DisplayConfigServiceImpl implements DisplayConfigService {
  final SystemChromeProvider _systemChrome;

  DisplayConfigServiceImpl(
    this._systemChrome,
  );

  @override
  Future<void> useDefaultMode() async {
    await _usePortraitUpOrientation();
    await _disableFullScreen();
  }

  Future<void> _usePortraitUpOrientation() async {
    await _systemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Future<void> _disableFullScreen() async {
    await _systemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom,
        SystemUiOverlay.top,
      ],
    );
  }

  @override
  Future<void> useDuelMode() async {
    await _useLandscapeLeftOrientation();
    await _useFullScreen();
  }

  Future<void> _useLandscapeLeftOrientation() async {
    await _systemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  Future<void> _useFullScreen() async {
    await _systemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
  }
}
