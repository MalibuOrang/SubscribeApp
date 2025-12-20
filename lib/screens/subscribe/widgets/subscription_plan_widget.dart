import 'package:flutter/material.dart';
import 'package:subscribe_app/domain/entities/subscription_plan.dart';

class SubscriptionPlanWidget extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isSelect;
  final VoidCallback onTap;
  final Color? primaryColor;

  const SubscriptionPlanWidget({
    super.key,
    required this.plan,
    required this.isSelect,
    required this.onTap,
    this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = primaryColor ?? theme.primaryColor;
    return Card(
      elevation: isSelect ? 4 : 2,
      color: isSelect ? color.withValues(alpha: 0.1) : null,
      child: ListTile(
        title: Text(plan.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(plan.description),
        trailing: Text(
          plan.price,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelect ? color : Colors.transparent,
            width: 2,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
