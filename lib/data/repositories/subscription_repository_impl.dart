import 'package:subscribe_app/domain/entities/subscription_plan.dart';
import 'package:subscribe_app/domain/repositories/subscription_repository.dart';
import 'package:subscribe_app/data/datasources/subscription_local_data_source.dart';
import 'package:subscribe_app/data/models/subscription_plan_dto.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionLocalDataSource _localDataSource;

  SubscriptionRepositoryImpl(this._localDataSource);

  @override
  Future<bool> isSubscribed() async {
    return await _localDataSource.isSubscribed();
  }

  @override
  Future<void> setSubscription(bool subscribed) async {
    await _localDataSource.setSubscription(subscribed);
  }

  @override
  List<SubscriptionPlan> getSubscriptionPlans() {
    // Возвращаем фиксированные планы подписки
    final plans = [
      SubscriptionPlanDto(
        id: 'month',
        title: 'Месяц',
        price: '149 ₽',
        description: 'Премиум доступ',
      ),
      SubscriptionPlanDto(
        id: 'year',
        title: 'Год',
        price: '99 ₽',
        description: 'Экономия 449 ₽',
      ),
    ];

    return plans.map((dto) => _mapDtoToEntity(dto)).toList();
  }

  @override
  SubscriptionPlan getSelectedPlan(String planId) {
    final plans = getSubscriptionPlans();
    return plans.firstWhere(
      (plan) => plan.id == planId,
      orElse: () => plans.first, // Возвращаем первый план, если не найден
    );
  }

  // Приватный метод для маппинга DTO в сущность
  SubscriptionPlan _mapDtoToEntity(SubscriptionPlanDto dto) {
    return SubscriptionPlan(
      id: dto.id,
      title: dto.title,
      price: dto.price,
      description: dto.description,
    );
  }
}
