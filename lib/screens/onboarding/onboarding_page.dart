import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscribe_app/presentation/providers/onboarding_provider.dart';
import 'package:subscribe_app/screens/onboarding/widgets/onboarding_view_widget.dart';
import 'package:subscribe_app/core/constants/app_constants.dart';

class OnboardingPage extends StatelessWidget {
  final VoidCallback? onCompleate;
  const OnboardingPage({super.key, this.onCompleate});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      child: Consumer<OnboardingProvider>(
        builder: (context, onboardingProvider, child) {
          return OnboardingViewWidget(
            pages: onboardingProvider.pages,
            onCompleate: () {
              if (onCompleate != null) {
                onCompleate!();
              } else {
                Navigator.of(context).pushReplacementNamed(AppRoutes.paywall);
              }
            },
          );
        },
      ),
    );
  }
}
