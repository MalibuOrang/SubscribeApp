import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subscribe_app/domain/entities/subscription_plan.dart';
import 'package:subscribe_app/screens/subscribe/widgets/subscription_plan_widget.dart';

void main() {
  const testPlan = SubscriptionPlan(
    id: 'test_id',
    title: 'Test Plan',
    price: '99 ₽',
    description: 'Test Description',
  );

  group('SubscriptionPlanWidget', () {
    testWidgets('renders plan details correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SubscriptionPlanWidget(
            plan: testPlan,
            isSelect: false,
            onTap: () {},
          ),
        ),
      );

      // Проверяем, что заголовок плана отображается
      expect(find.text('Test Plan'), findsOneWidget);

      // Проверяем, что описание плана отображается
      expect(find.text('Test Description'), findsOneWidget);

      // Проверяем, что цена плана отображается
      expect(find.text('99 ₽'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      var tapped = false;
      void voidCallback() {
        tapped = true;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: SubscriptionPlanWidget(
            plan: testPlan,
            isSelect: false,
            onTap: voidCallback,
          ),
        ),
      );

      await tester.tap(find.byType(ListTile));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('shows selection state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Column(
            children: [
              SubscriptionPlanWidget(
                plan: testPlan,
                isSelect: true,
                onTap: () {},
              ),
              SubscriptionPlanWidget(
                plan: testPlan,
                isSelect: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      );

      // Проверяем, что выделенный элемент отображается иначе
      final selectedFinder = find.byWidgetPredicate(
        (widget) => widget is Card && widget.elevation == 4,
      );

      final unselectedFinder = find.byWidgetPredicate(
        (widget) => widget is Card && widget.elevation == 2,
      );

      expect(selectedFinder, findsOneWidget);
      expect(unselectedFinder, findsOneWidget);
    });
  });
}
