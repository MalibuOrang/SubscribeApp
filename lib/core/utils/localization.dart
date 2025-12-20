// Класс для управления локализацией приложения
class AppLocalization {
  // Текущий язык приложения
  static String _currentLocale = 'ru';

  // Метод для установки языка
  static void setLocale(String locale) {
    _currentLocale = locale;
  }

  // Метод для получения текущего языка
  static String get currentLocale => _currentLocale;

  // Метод для получения текста на основе ключа
  static String tr(String key) {
    // Возвращаем текст на основе текущей локали
    // В реальном приложении здесь будет логика получения перевода
    switch (_currentLocale) {
      case 'ru':
        return _ruTranslations[key] ?? key;
      case 'en':
        return _enTranslations[key] ?? key;
      default:
        return _enTranslations[key] ?? key;
    }
  }

  // Русские переводы
  static const Map<String, String> _ruTranslations = {
    'app_name': 'Subscribe App',
    'welcome_title': 'Добро пожаловать!',
    'welcome_description': 'Это приложение поможет вам достигать целей',
    'subscribe_title': 'Начните использовать',
    'subscribe_description': 'Подпишитесь, чтобы получить полный доступ',
    'subscription_page_title': 'Подписка',
    'choose_plan_title': 'Выберите план',
    'subscribe_button_text': 'Оформить подписку',
    'home_screen_title': 'Главная',
    'back_button_text': 'Назад',
    'next_button_text': 'Далее',
    'start_button_text': 'Начать',
    'month_plan_title': 'Месяц',
    'year_plan_title': 'Год',
    'month_plan_price': '149 ₽',
    'year_plan_price': '99 ₽',
    'premium_access_description': 'Премиум доступ',
    'savings_description': 'Экономия 449 ₽',
    'home_welcome_title': 'Добро пожаловать!',
    'home_welcome_description':
        'Это главный экран приложения подписки. Здесь вы можете управлять своими подписками и просматривать контент.',
  };

  // Английские переводы
  static const Map<String, String> _enTranslations = {
    'app_name': 'Subscribe App',
    'welcome_title': 'Welcome!',
    'welcome_description': 'This app will help you achieve your goals',
    'subscribe_title': 'Start using',
    'subscribe_description': 'Subscribe to get full access',
    'subscription_page_title': 'Subscription',
    'choose_plan_title': 'Choose a plan',
    'subscribe_button_text': 'Subscribe',
    'home_screen_title': 'Home',
    'back_button_text': 'Back',
    'next_button_text': 'Next',
    'start_button_text': 'Start',
    'month_plan_title': 'Month',
    'year_plan_title': 'Year',
    'month_plan_price': '4.99 \$',
    'year_plan_price': '29.99 \$',
    'premium_access_description': 'Premium access',
    'savings_description': 'Save 24.99 \$',
    'home_welcome_title': 'Welcome!',
    'home_welcome_description':
        'This is the main subscription app screen. Here you can manage your subscriptions and view content.',
  };
}
