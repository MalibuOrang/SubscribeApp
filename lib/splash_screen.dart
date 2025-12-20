import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscribe_app/presentation/providers/app_state_provider.dart';
import 'package:subscribe_app/core/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AppStateProvider _appStateProvider;
  bool _isListenerAdded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkAndNavigate());
  }

  void _checkAndNavigate() {
    _appStateProvider = Provider.of<AppStateProvider>(context, listen: false);
    if (_appStateProvider.initialRoute != null) {
      _navigateToInitialScreen(_appStateProvider.initialRoute!);
    } else {
      // Если маршрут не инициализирован, продолжаем наблюдать
      _appStateProvider.addListener(_onRouteChanged);
      _isListenerAdded = true;
    }
  }

  void _onRouteChanged() {
    if (_appStateProvider.initialRoute != null) {
      _navigateToInitialScreen(_appStateProvider.initialRoute!);
    }
  }

  void _navigateToInitialScreen(String initialRoute) {
    if (mounted) {
      if (_isListenerAdded) {
        _appStateProvider.removeListener(_onRouteChanged);
        _isListenerAdded = false;
      }
      if (initialRoute == AppRoutes.home) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      } else {
        Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
      }
    }
  }

  @override
  void dispose() {
    // Убираем слушатель при уничтожении виджета, если он был добавлен
    if (_isListenerAdded) {
      _appStateProvider.removeListener(_onRouteChanged);
      _isListenerAdded = false;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
