import 'package:subscribe_app/model/onboarding_page_model.dart';
import 'package:subscribe_app/core/constants/app_constants.dart';
import 'package:subscribe_app/core/base/base_provider.dart';

class OnboardingProvider extends BaseProvider {
  int _currentPage = 0;
  final List<OnboardingPageModel> _pages = [
    OnboardingPageModel(
      title: TextConstants.welcomeTitle,
      description: TextConstants.welcomeDescription,
    ),
    OnboardingPageModel(
      title: TextConstants.subscribeTitle,
      description: TextConstants.subscribeDescription,
    ),
  ];

  int get currentPage => _currentPage;
  List<OnboardingPageModel> get pages => [
    ..._pages,
  ]; // Возвращаем копию для безопасности

  int get totalPages => _pages.length;

  void nextPage() {
    if (_currentPage < _pages.length - 1) {
      _currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      notifyListeners();
    }
  }

  void goToPage(int index) {
    if (index >= 0 && index < _pages.length) {
      _currentPage = index;
      notifyListeners();
    }
  }

  bool get isLastPage => _currentPage == _pages.length - 1;
  bool get isFirstPage => _currentPage == 0;
}
