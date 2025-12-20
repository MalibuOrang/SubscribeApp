// Утилита для логирования
class AppLogger {
  static void log(String message, {String tag = 'APP'}) {
    // В продакшене можно отключить логирование
    // или отправлять в систему отслеживания ошибок
    log('[$tag] $message');
  }

  static void error(String message, {String tag = 'ERROR'}) {
    log('[$tag] $message');
  }
}
