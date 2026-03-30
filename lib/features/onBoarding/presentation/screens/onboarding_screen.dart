import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/features/onBoarding/data/model/onboarding_model.dart';
import 'package:crypto_trade/features/onBoarding/presentation/widgets/onboarding_dot_indicator.dart';
import 'package:crypto_trade/features/onBoarding/presentation/widgets/onboarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingModel> _pages = OnboardingModel.pages;

  bool get _isLastPage => _currentIndex == _pages.length - 1;

  void _onNextPressed() {
    if (_isLastPage) {
      Navigator.pushReplacementNamed(context, Routes.authScreen);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.2,
            colors: [
              AppColors.primary.withValues(alpha: 0.1),
              AppColors.darkBackground,
            ],
            stops: const [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              verticalSpace(40),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) =>
                      setState(() => _currentIndex = index),
                  itemBuilder: (context, index) =>
                      OnboardingPageWidget(page: _pages[index]),
                ),
              ),
              OnboardingDotIndicator(
                count: _pages.length,
                currentIndex: _currentIndex,
              ),
              verticalSpace(32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: _onNextPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.darkBackground,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    child: Text(
                      _isLastPage ? 'Get Started' : 'Next',
                      style: AppStyle.font18_400Weight.copyWith(
                        color: AppColors.darkBackground,
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
