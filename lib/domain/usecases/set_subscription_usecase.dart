import 'package:subscribe_app/domain/repositories/subscription_repository.dart';
import 'package:subscribe_app/core/utils/result.dart';

// Абстрактный класс для установки статуса подписки
abstract class SetSubscriptionUseCase {
  Future<Result<void>> execute(bool subscribed);
}

// Реализация use case для установки статуса подписки
class SetSubscriptionUseCaseImpl implements SetSubscriptionUseCase {
  final SubscriptionRepository _repository;

  SetSubscriptionUseCaseImpl(this._repository);

  @override
  Future<Result<void>> execute(bool subscribed) async {
    try {
      await _repository.setSubscription(subscribed);
      return const Success(null);
    } catch (e) {
      return Error(e.toString());
    }
  }
}
