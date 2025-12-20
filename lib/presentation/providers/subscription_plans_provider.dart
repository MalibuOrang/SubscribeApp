import 'package:subscribe_app/domain/entities/subscription_plan.dart';
import 'package:subscribe_app/presentation/providers/subscription_provider.dart';
import 'package:subscribe_app/core/base/base_provider.dart';

class SubscriptionPlansProvider extends BaseProvider {
  String _selectedPlanId = 'month';
  final SubscriptionProvider _subscriptionProvider;

  SubscriptionPlansProvider(this._subscriptionProvider) {
    _selectedPlanId = _subscriptionProvider.selectedPlanId;
  }

  String get selectedPlanId => _selectedPlanId;
  bool get isProcessing => isLoading;
  List<SubscriptionPlan> get plans => _subscriptionProvider.plans;

  SubscriptionPlan? get selectedPlan {
    return _subscriptionProvider.selectedPlan;
  }

  void selectPlan(String planId) {
    _selectedPlanId = planId;
    _subscriptionProvider.selectPlan(planId);
    notifyListeners();
  }

  void setProcessing(bool processing) {
    setLoading(processing);
  }
}
