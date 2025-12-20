import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscribe_app/core/constants/app_constants.dart';
import 'package:subscribe_app/presentation/providers/subscription_provider.dart';
import 'widgets/header_widget.dart';
import 'widgets/item_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstants.homeScreenTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<SubscriptionProvider>(
                builder: (context, subscriptionProvider, child) {
                  return HeaderWidget(
                    title: TextConstants.homeWelcomeTitle,
                    description: TextConstants.homeWelcomeDescription,
                  );
                },
              ),
              const SizedBox(height: 32),
              const ItemListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
