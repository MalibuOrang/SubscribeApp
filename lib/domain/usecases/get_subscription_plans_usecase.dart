import 'package:subscribe_app/domain/entities/subscription_plan.dart';
import 'package:subscribe_app/domain/repositories/subscription_repository.dart';
import 'package:subscribe_app/core/utils/result.dart';

// Абстрактный класс для получения планов подписки
abstract class GetSubscriptionPlansUseCase {
  Future<Result<List<SubscriptionPlan>>> execute();
}

// Реализация use case для получения планов подписки
class GetSubscriptionPlansUseCaseImpl implements GetSubscriptionPlansUseCase {
  final SubscriptionRepository _repository;

  GetSubscriptionPlansUseCaseImpl(this._repository);

  @override
  Future<Result<List<SubscriptionPlan>>> execute() async {
    try {
      final plans = _repository.getSubscriptionPlans();
      return Success(plans);
    } catch (e) {
      return Error(e.toString());
    }
  }
}
