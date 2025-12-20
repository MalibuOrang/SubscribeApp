import 'package:subscribe_app/domain/usecases/get_subscription_status_usecase.dart';
import 'package:subscribe_app/domain/usecases/set_subscription_usecase.dart';
import 'package:subscribe_app/domain/usecases/get_subscription_plans_usecase.dart';
import 'package:subscribe_app/domain/entities/subscription_plan.dart';
import 'package:subscribe_app/core/utils/result.dart';
import 'package:subscribe_app/core/base/base_provider.dart';

class SubscriptionProvider extends BaseProvider {
  final GetSubscriptionStatusUseCase _getSubscriptionStatusUseCase;
  final SetSubscriptionUseCase _setSubscriptionUseCase;
  final GetSubscriptionPlansUseCase _getSubscriptionPlansUseCase;

  bool _isSubscribed = false;
  final bool _isLoading = false;
  String _selectedPlanId = 'month';
  List<SubscriptionPlan> _plans = [];

  SubscriptionProvider(
    this._getSubscriptionStatusUseCase,
    this._setSubscriptionUseCase,
    this._getSubscriptionPlansUseCase,
  ) {
    _initializePlans();
  }

  bool get isSubscribed => _isSubscribed;
  @override
  bool get isLoading => _isLoading;
  String get selectedPlanId => _selectedPlanId;
  List<SubscriptionPlan> get plans => _plans;

  SubscriptionPlan? get selectedPlan {
    return _plans.firstWhere(
      (plan) => plan.id == _selectedPlanId,
      orElse: () => _plans.first,
    );
  }

  Future<void> checkSubscriptionStatus() async {
    setLoading(true);

    final result = await _getSubscriptionStatusUseCase.execute();
    if (result is Success<bool>) {
      bool previousSubscribed = _isSubscribed;
      _isSubscribed = result.data;

      // Уведомляем об изменении статуса подписки, если он изменился
      if (previousSubscribed != _isSubscribed) {
        notifyListeners();
      }
    }

    setLoading(false);
  }

  Future<void> subscribe() async {
    setLoading(true);

    final result = await _setSubscriptionUseCase.execute(true);
    if (result is Success<void>) {
      _isSubscribed = true;
      notifyListeners(); // Уведомляем об изменении статуса подписки
    }

    setLoading(false);
  }

  Future<void> unsubscribe() async {
    setLoading(true);

    final result = await _setSubscriptionUseCase.execute(false);
    if (result is Success<void>) {
      _isSubscribed = false;
      notifyListeners(); // Уведомляем об изменении статуса подписки
    }

    setLoading(false);
  }

  void selectPlan(String planId) {
    _selectedPlanId = planId;
    notifyListeners();
  }

  void _initializePlans() {
    final result = _getSubscriptionPlansUseCase.execute();
    result.then((plansResult) {
      if (plansResult is Success<List<SubscriptionPlan>>) {
        _plans = plansResult.data;
        notifyListeners();
      }
    });
  }
}
