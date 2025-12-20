import 'package:flutter/foundation.dart';
import 'package:subscribe_app/presentation/providers/app_state_provider.dart';
import 'package:subscribe_app/presentation/providers/subscription_provider.dart';

// Класс для управления глобальным состоянием приложения
class AppStateManager extends ChangeNotifier {
  final AppStateProvider _appStateProvider;
  final SubscriptionProvider _subscriptionProvider;

  AppStateManager(this._appStateProvider, this._subscriptionProvider) {
    // Подписываемся на изменения состояния
    _subscriptionProvider.addListener(_onSubscriptionStatusChanged);
  }

  @override
  void dispose() {
    _subscriptionProvider.removeListener(_onSubscriptionStatusChanged);
    super.dispose();
  }

  // Обработчик изменения статуса подписки
  void _onSubscriptionStatusChanged() {
    // Обновляем начальный маршрут при изменении статуса подписки
    _appStateProvider.navigateToHome();
    notifyListeners();
  }

  // Метод для проверки статуса подписки
  Future<void> checkSubscriptionStatus() async {
    await _subscriptionProvider.checkSubscriptionStatus();
  }

  // Метод для оформления подписки
  Future<void> subscribe() async {
    await _subscriptionProvider.subscribe();
  }

  // Метод для отписки
  Future<void> unsubscribe() async {
    await _subscriptionProvider.unsubscribe();
  }

  // Получить статус подписки
  bool get isSubscribed => _subscriptionProvider.isSubscribed;

  // Получить статус загрузки
  bool get isLoading => _subscriptionProvider.isLoading;
}
