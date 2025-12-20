// Константы для всего приложения
class AppConstants {
  // Размеры
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;

  static const double buttonHeight = 48.0;
  static const double appBarHeight = 56.0;

  // Тексты
  static const String appName = 'Subscribe App';

  // Длительности анимаций
  static const Duration transitionDuration = Duration(milliseconds: 300);
}

// Константы для маршрутов приложения
class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String paywall = '/paywall';
  static const String home = '/home';
}

// Константы для ключей SharedPreferences
class StorageKeys {
  static const String subscriptionKey = 'is_subscribed';
  static const String onboardingCompleted = 'onboarding_completed';
}

// Константы для ID планов подписки
class SubscriptionPlanIds {
  static const String month = 'month';
  static const String year = 'year';
}

// Константы для текста
class TextConstants {
  static const String welcomeTitle = 'Добро пожаловать!';
  static const String welcomeDescription =
      'Начните пользоваться всеми возможностями приложения уже сейчас.';

  static const String subscribeTitle = 'Оформите подписку';
  static const String subscribeDescription =
      'Получите полный доступ ко всем функциям без ограничений.';

  static const String subscriptionPageTitle = 'Подписка Premium';
  static const String choosePlanTitle = 'Выберите подходящий тариф';

  static const String subscribeButtonText = 'Оформить подписку';

  static const String homeScreenTitle = 'Главная';

  static const String backButtonText = 'Назад';
  static const String nextButtonText = 'Далее';
  static const String startButtonText = 'Начать';

  static const String monthPlanTitle = 'Месячный тариф';
  static const String yearPlanTitle = 'Годовой тариф';

  static const String monthPlanPrice = '199 ₽ / месяц';
  static const String yearPlanPrice = '1999 ₽ / год';

  static const String premiumAccessDescription =
      'Неограниченный доступ ко всем функциям приложения.';
  static const String savingsDescription =
      'Экономия до 40% при годовой подписке.';

  static const String homeWelcomeTitle = 'Рады вас видеть 👋';
  static const String homeWelcomeDescription =
      'Продолжайте работу и откройте новые возможности приложения.';
}
