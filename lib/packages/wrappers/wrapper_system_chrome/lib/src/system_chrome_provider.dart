import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class SystemChromeProvider {
  Future<void> setPreferredOrientations(List<DeviceOrientation> orientations);
  Future<void> setEnabledSystemUIMode(SystemUiMode mode, {List<SystemUiOverlay>? overlays});
}

@LazySingleton(as: SystemChromeProvider)
class SystemChromeProviderImpl implements SystemChromeProvider {
  @override
  Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) {
    return SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  Future<void> setEnabledSystemUIMode(SystemUiMode mode, {List<SystemUiOverlay>? overlays}) async {
    return SystemChrome.setEnabledSystemUIMode(mode, overlays: overlays);
  }
}
