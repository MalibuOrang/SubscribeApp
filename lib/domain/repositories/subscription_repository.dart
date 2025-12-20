import 'package:subscribe_app/domain/entities/subscription_plan.dart';

// Абстрактный класс репозитория подписки
abstract class SubscriptionRepository {
  Future<bool> isSubscribed();
  Future<void> setSubscription(bool subscribed);
  List<SubscriptionPlan> getSubscriptionPlans();
  SubscriptionPlan getSelectedPlan(String planId);
}
