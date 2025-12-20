import 'package:subscribe_app/domain/repositories/subscription_repository.dart';
import 'package:subscribe_app/core/utils/result.dart';

// Абстрактный класс для получения статуса подписки
abstract class GetSubscriptionStatusUseCase {
  Future<Result<bool>> execute();
}

// Реализация use case для получения статуса подписки
class GetSubscriptionStatusUseCaseImpl implements GetSubscriptionStatusUseCase {
  final SubscriptionRepository _repository;

  GetSubscriptionStatusUseCaseImpl(this._repository);

  @override
  Future<Result<bool>> execute() async {
    try {
      final isSubscribed = await _repository.isSubscribed();
      return Success(isSubscribed);
    } catch (e) {
      return Error(e.toString());
    }
  }
}
