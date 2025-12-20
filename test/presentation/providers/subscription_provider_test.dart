import 'package:flutter_test/flutter_test.dart';
import 'package:subscribe_app/domain/usecases/get_subscription_status_usecase.dart';
import 'package:subscribe_app/domain/usecases/set_subscription_usecase.dart';
import 'package:subscribe_app/domain/usecases/get_subscription_plans_usecase.dart';
import 'package:subscribe_app/presentation/providers/subscription_provider.dart';
import 'package:subscribe_app/core/utils/result.dart';
import 'package:subscribe_app/domain/entities/subscription_plan.dart';

// Мок-классы
class MockGetSubscriptionStatusUseCase implements GetSubscriptionStatusUseCase {
  bool shouldThrow = false;
  bool subscriptionStatus = false;

  @override
  Future<Result<bool>> execute() async {
    if (shouldThrow) {
      return Error('Error');
    }
    return Success(subscriptionStatus);
  }
}

class MockSetSubscriptionUseCase implements SetSubscriptionUseCase {
  bool shouldThrow = false;

  @override
  Future<Result<void>> execute(bool subscribed) async {
    if (shouldThrow) {
      return Error('Error');
    }
    return const Success(null);
  }
}

class MockGetSubscriptionPlansUseCase implements GetSubscriptionPlansUseCase {
  bool shouldThrow = false;
  List<SubscriptionPlan> plans = [];

  @override
  Future<Result<List<SubscriptionPlan>>> execute() async {
    if (shouldThrow) {
      return Error('Error');
    }
    return Success(plans);
  }
}

void main() {
  late SubscriptionProvider provider;
  late MockGetSubscriptionStatusUseCase mockGetStatusUseCase;
  late MockSetSubscriptionUseCase mockSetStatusUseCase;
  late MockGetSubscriptionPlansUseCase mockGetPlansUseCase;

  setUp(() {
    mockGetStatusUseCase = MockGetSubscriptionStatusUseCase();
    mockSetStatusUseCase = MockSetSubscriptionUseCase();
    mockGetPlansUseCase = MockGetSubscriptionPlansUseCase();

    // Создаем провайдер с моками
    provider = SubscriptionProvider(
      mockGetStatusUseCase,
      mockSetStatusUseCase,
      mockGetPlansUseCase,
    );
  });

  group('SubscriptionProvider', () {
    test(
      'should update subscription status when checkSubscriptionStatus is called',
      () async {
        // arrange
        mockGetStatusUseCase.subscriptionStatus = true;

        // act
        await provider.checkSubscriptionStatus();

        // assert
        expect(provider.isSubscribed, true);
      },
    );

    test(
      'should update subscription status when subscribe is called',
      () async {
        // act
        await provider.subscribe();

        // assert
        expect(provider.isSubscribed, true);
      },
    );

    test(
      'should update subscription status when unsubscribe is called',
      () async {
        // act
        await provider.unsubscribe();

        // assert
        expect(provider.isSubscribed, false);
      },
    );
  });
}
