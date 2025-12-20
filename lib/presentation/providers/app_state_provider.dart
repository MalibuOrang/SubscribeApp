import 'package:subscribe_app/presentation/providers/subscription_provider.dart';
import 'package:subscribe_app/core/constants/app_constants.dart';
import 'package:subscribe_app/core/base/base_provider.dart';

class AppStateProvider extends BaseProvider {
  String? _initialRoute;
  final SubscriptionProvider _subscriptionProvider;

  String? get initialRoute => _initialRoute;

  AppStateProvider(this._subscriptionProvider) {
    _initializeApp();
    // Добавляем слушатель изменений статуса подписки
    _subscriptionProvider.addListener(_onSubscriptionStatusChanged);
  }

  Future<void> _initializeApp() async {
    setLoading(true);

    // Проверяем статус подписки
    await _subscriptionProvider.checkSubscriptionStatus();

    // Определяем начальный маршрут на основе статуса подписки
    _initialRoute = _getInitialRoute();

    setLoading(false);
  }

  String _getInitialRoute() {
    if (_subscriptionProvider.isSubscribed) {
      return AppRoutes.home;
    } else {
      return AppRoutes.onboarding;
    }
  }

  void navigateToOnboarding() {
    _initialRoute = AppRoutes.onboarding;
    notifyListeners();
  }

  void navigateToPaywall() {
    _initialRoute = AppRoutes.paywall;
    notifyListeners();
  }

  void navigateToHome() {
    _initialRoute = AppRoutes.home;
    notifyListeners();
  }

  void _onSubscriptionStatusChanged() {
    // Обновляем начальный маршрут при изменении статуса подписки
    _initialRoute = _getInitialRoute();
    notifyListeners();
  }

  @override
  void dispose() {
    // Удаляем слушатель при уничтожении провайдера
    _subscriptionProvider.removeListener(_onSubscriptionStatusChanged);
    super.dispose();
  }
}
