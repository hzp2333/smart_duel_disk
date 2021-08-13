abstract class Logger {
  void print(String message);
  void verbose(String tag, String message);
  void debug(String tag, String message);
  void info(String tag, String message);
  void warning(String tag, String message);
  // ignore: avoid_annotating_with_dynamic
  void error(String tag, String message, dynamic exception, StackTrace stackTrace);
}
