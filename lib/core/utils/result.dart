// Класс для представления результата операции
sealed class Result<T> {
  const Result();
}

// Успешный результат
class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

// Ошибка
class Error<T> extends Result<T> {
  final String message;

  const Error(this.message);
}
