import 'package:flutter_test/flutter_test.dart';
import 'package:subscribe_app/domain/repositories/subscription_repository.dart';
import 'package:subscribe_app/domain/usecases/get_subscription_status_usecase.dart';
import 'package:subscribe_app/core/utils/result.dart';
import 'package:subscribe_app/domain/entities/subscription_plan.dart';

// Простой мок репозитория для тестирования
class MockSubscriptionRepository implements SubscriptionRepository {
  bool subscriptionStatus = false;
  bool shouldThrow = false;

  @override
  Future<bool> isSubscribed() async {
    if (shouldThrow) {
      throw Exception('Error');
    }
    return subscriptionStatus;
  }

  @override
  Future<void> setSubscription(bool subscribed) async {
    subscriptionStatus = subscribed;
  }

  @override
  List<SubscriptionPlan> getSubscriptionPlans() {
    return [];
  }

  @override
  SubscriptionPlan getSelectedPlan(String planId) {
    return SubscriptionPlan(
      id: 'test',
      title: 'Test',
      price: '0',
      description: 'Test',
    );
  }
}

void main() {
  late GetSubscriptionStatusUseCase usecase;
  late MockSubscriptionRepository mockRepository;

  setUp(() {
    mockRepository = MockSubscriptionRepository();
    usecase = GetSubscriptionStatusUseCaseImpl(mockRepository);
  });

  test('should return subscription status from repository', () async {
    // arrange
    const expectedStatus = true;
    mockRepository.subscriptionStatus = expectedStatus;

    // act
    final result = await usecase.execute();

    // assert
    expect(result, isA<Success<bool>>());
    expect((result as Success<bool>).data, equals(expectedStatus));
  });

  test('should return error when repository throws exception', () async {
    // arrange
    mockRepository.shouldThrow = true;

    // act
    final result = await usecase.execute();

    // assert
    expect(result, isA<Error<bool>>());
  });
}
