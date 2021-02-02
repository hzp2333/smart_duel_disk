abstract class Logger {
  void print(String message);

  void verbose(String tag, String message);

  void debug(String tag, String message);

  void info(String tag, String message);

  void warning(String tag, String message);

  void error(String tag, String message, dynamic exception, StackTrace stackTrace);
}
