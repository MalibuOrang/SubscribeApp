import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:subscribe_app/model/onboarding_page_model.dart';
import 'package:subscribe_app/screens/onboarding/widgets/page_widget.dart';

class OnboardingViewWidget extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final VoidCallback onCompleate;
  final Color? indicatorColor;
  final Color? indicatorDocColor;
  final double indicatorSize;
  final Curve animationCurve;
  final Duration animationDuration;

  const OnboardingViewWidget({
    super.key,
    required this.pages,
    required this.onCompleate,
    this.indicatorColor,
    this.indicatorDocColor,
    this.indicatorSize = 8.0,
    this.animationCurve = Curves.easeInOut,
    this.animationDuration = const Duration(microseconds: 300),
  });

  @override
  State<OnboardingViewWidget> createState() => _OnboardingViewWidgetState();
}

class _OnboardingViewWidgetState extends State<OnboardingViewWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final indicatorColor =
        widget.indicatorColor ?? Theme.of(context).colorScheme.primary;
    final indicatorDocColor = widget.indicatorDocColor ?? Colors.grey;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: widget.pages.length,
                itemBuilder: (contex, index) {
                  final page = widget.pages[index];
                  return PageWidget(
                    title: page.title,
                    description: page.description,
                    imagePath: page.imagePath,
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    TextButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: widget.animationDuration,
                          curve: widget.animationCurve,
                        );
                      },
                      child: Text('Назад'),
                    )
                  else
                    SizedBox.shrink(),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: widget.pages.length,
                    effect: ExpandingDotsEffect(
                      dotWidth: widget.indicatorSize,
                      dotHeight: widget.indicatorSize,
                      dotColor: indicatorDocColor,
                      activeDotColor: indicatorColor,
                      spacing: 6,
                    ),
                  ),
                  if (_currentPage < widget.pages.length - 1)
                    TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: widget.animationDuration,
                          curve: widget.animationCurve,
                        );
                      },
                      child: Text('Далее'),
                    )
                  else
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: widget.onCompleate,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Text('Начать'),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
