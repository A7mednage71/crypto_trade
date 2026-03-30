import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/auth/presentation/screens/sign_in_body.dart';
import 'package:crypto_trade/features/auth/presentation/screens/sign_up_body.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/auth_tab_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatefulWidget {
  final int initialTab;

  const AuthScreen({super.key, this.initialTab = 0});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late int _currentTab;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentTab = widget.initialTab;
    _pageController = PageController(initialPage: widget.initialTab);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() => _currentTab = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkSurface,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.darkSurface,
              AppColors.primary.withValues(alpha: 0.1),
            ],
            stops: const [0.85, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(50),
                AuthTabToggle(
                  currentIndex: _currentTab,
                  onTabChanged: _onTabChanged,
                ),
                verticalSpace(50),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (i) => setState(() => _currentTab = i),
                    children: const [SignInBody(), SignUpBody()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
