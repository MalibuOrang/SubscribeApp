// Абстрактный класс для ошибок
abstract class Failure {
  final String message;

  Failure(this.message);
}

// Ошибки подписки
class SubscriptionFailure extends Failure {
  SubscriptionFailure(super.message);
}

// Ошибки хранения данных
class StorageFailure extends Failure {
  StorageFailure(super.message);
}

// Ошибки валидации
class ValidationFailure extends Failure {
  ValidationFailure(super.message);
}
