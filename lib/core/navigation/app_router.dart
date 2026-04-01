import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/features/auth/presentation/screens/auth_screen.dart';
import 'package:crypto_trade/features/home/presentation/screens/home_screen.dart';
import 'package:crypto_trade/features/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:crypto_trade/features/onBoarding/presentation/screens/onboarding_screen.dart';
import 'package:crypto_trade/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:crypto_trade/features/profile/presentation/screens/view_profile_screen.dart';
import 'package:crypto_trade/features/settings/presentation/screens/settings_screen.dart';
import 'package:crypto_trade/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const SplashScreen();
          },
        );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => const AuthScreen());

      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ViewProfileScreen());
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case Routes.mainLayoutScreen:
        return MaterialPageRoute(builder: (_) => const MainLayoutScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
    return null;
  }
}
