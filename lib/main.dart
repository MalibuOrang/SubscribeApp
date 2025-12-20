import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscribe_app/core/utils/app_router.dart';
import 'package:subscribe_app/di/injection.dart';
import 'package:subscribe_app/presentation/providers/app_state_provider.dart';
import 'package:subscribe_app/presentation/providers/subscription_provider.dart';
import 'package:subscribe_app/presentation/providers/subscription_plans_provider.dart';
import 'package:subscribe_app/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateProvider>(
          create: (_) => getIt<AppStateProvider>(),
        ),
        ChangeNotifierProvider<SubscriptionProvider>(
          create: (_) => getIt<SubscriptionProvider>(),
        ),
        ChangeNotifierProvider<SubscriptionPlansProvider>(
          create: (_) => getIt<SubscriptionPlansProvider>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Subscribe App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        home: Consumer<AppStateProvider>(
          builder: (context, appStateProvider, child) {
            // Если идет загрузка, показываем сплэш экран
            if (appStateProvider.isLoading ||
                appStateProvider.initialRoute == null) {
              return const SplashScreen();
            }

            // Когда инициализация завершена, определяем, что показывать
            // Оставляем SplashScreen, но он будет использовать навигацию
            return const SplashScreen();
          },
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
