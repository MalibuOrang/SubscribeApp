import 'localization.dart';

// Класс-помощник для получения локализованных строк
class TranslationHelper {
  // Метод для получения перевода по ключу
  static String tr(String key) {
    return AppLocalization.tr(key);
  }

  // Метод для получения перевода по ключу с параметрами
  static String trWithParams(String key, {Map<String, String>? params}) {
    String translated = AppLocalization.tr(key);

    if (params != null) {
      params.forEach((key, value) {
        translated = translated.replaceAll('{{$key}}', value);
      });
    }

    return translated;
  }
}
