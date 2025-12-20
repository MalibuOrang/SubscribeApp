import 'package:flutter/material.dart';
import 'package:subscribe_app/core/constants/app_constants.dart';
import 'package:subscribe_app/screens/home/home_page.dart';
import 'package:subscribe_app/screens/onboarding/onboarding_page.dart';
import 'package:subscribe_app/screens/subscribe/subscribe_page.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        // SplashScreen теперь обрабатывается в основном виджете
        // Возвращаем HomePage как fallback для главного маршрута
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingPage(
            onCompleate: () {
              // Логика завершения онбординга - переходим к экрану подписки
              Navigator.of(context).pushReplacementNamed(AppRoutes.paywall);
            },
          ),
        );
      case AppRoutes.paywall:
        return MaterialPageRoute(
          builder: (context) => SubscribePage(
            onSubscribe: () {
              // Логика оформления подписки - переходим на главную страницу
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
            },
          ),
        );
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
