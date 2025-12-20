import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscribe_app/core/constants/app_constants.dart';
import 'package:subscribe_app/presentation/providers/subscription_provider.dart';
import 'package:subscribe_app/presentation/providers/subscription_plans_provider.dart';
import 'package:subscribe_app/screens/subscribe/widgets/subscription_plan_widget.dart';

class SubscribePage extends StatelessWidget {
  final VoidCallback? onSubscribe;

  const SubscribePage({super.key, this.onSubscribe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstants.subscriptionPageTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.paddingLarge),
        child: Consumer2<SubscriptionProvider, SubscriptionPlansProvider>(
          builder: (context, subscriptionProvider, plansProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  TextConstants.choosePlanTitle,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ...plansProvider.plans.map((plan) {
                  return SubscriptionPlanWidget(
                    plan: plan,
                    isSelect: plansProvider.selectedPlanId == plan.id,
                    onTap: () {
                      plansProvider.selectPlan(plan.id);
                    },
                  );
                }),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: plansProvider.isProcessing
                      ? null
                      : () async {
                          plansProvider.setProcessing(true);
                          await subscriptionProvider.subscribe();
                          plansProvider.setProcessing(false);

                          if (onSubscribe != null) {
                            onSubscribe!();
                          } else {
                            if (context.mounted) {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(AppRoutes.home);
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: plansProvider.isProcessing
                      ? CircularProgressIndicator()
                      : Text(
                          TextConstants.subscribeButtonText,
                          style: TextStyle(fontSize: 18),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
