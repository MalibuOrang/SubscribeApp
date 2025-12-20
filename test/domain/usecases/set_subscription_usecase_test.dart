import 'package:flutter_test/flutter_test.dart';
import 'package:subscribe_app/domain/repositories/subscription_repository.dart';
import 'package:subscribe_app/domain/entities/subscription_plan.dart';
import 'package:subscribe_app/domain/usecases/set_subscription_usecase.dart';
import 'package:subscribe_app/core/utils/result.dart';

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
    if (shouldThrow) {
      throw Exception('Error');
    }
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
  late SetSubscriptionUseCase usecase;
  late MockSubscriptionRepository mockRepository;

  setUp(() {
    mockRepository = MockSubscriptionRepository();
    usecase = SetSubscriptionUseCaseImpl(mockRepository);
  });

  test('should set subscription status in repository', () async {
    // arrange
    const newStatus = true;

    // act
    final result = await usecase.execute(newStatus);

    // assert
    expect(result, isA<Success<void>>());
    expect(mockRepository.subscriptionStatus, equals(newStatus));
  });

  test('should return error when repository throws exception', () async {
    // arrange
    mockRepository.shouldThrow = true;
    const newStatus = true;

    // act
    final result = await usecase.execute(newStatus);

    // assert
    expect(result, isA<Error<void>>());
  });
}
