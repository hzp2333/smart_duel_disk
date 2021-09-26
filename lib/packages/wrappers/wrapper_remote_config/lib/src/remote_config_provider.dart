abstract class RemoteConfigProvider {
  Future<void> init();
  String getString(String key);
}
