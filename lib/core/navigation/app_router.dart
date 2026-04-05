import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/core/services/locator/get_it_locator.dart';
import 'package:crypto_trade/features/auth/data/models/verification_params.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/otp_cubit/otp_cubit.dart';
import 'package:crypto_trade/features/auth/presentation/screens/auth_screen.dart';
import 'package:crypto_trade/features/auth/presentation/screens/auth_with_mobile_screen.dart';
import 'package:crypto_trade/features/auth/presentation/screens/registration_success_screen.dart';
import 'package:crypto_trade/features/auth/presentation/screens/verification_screen.dart';
import 'package:crypto_trade/features/home/presentation/screens/home_screen.dart';
import 'package:crypto_trade/features/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:crypto_trade/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:crypto_trade/features/onBoarding/presentation/screens/onboarding_screen.dart';
import 'package:crypto_trade/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:crypto_trade/features/profile/presentation/screens/view_profile_screen.dart';
import 'package:crypto_trade/features/settings/presentation/screens/settings_screen.dart';
import 'package:crypto_trade/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case Routes.registerWithMobile:
        final bool isLogin = arguments as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ServicesLocator.locator<OtpCubit>(),
            child: AuthWithMobileScreen(isLogin: isLogin),
          ),
        );
      case Routes.verificationScreen:
        final params = arguments as VerificationParams;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: params.otpCubit,
            child: VerificationScreen(params: params),
          ),
        );
      case Routes.successRegistrationScreen:
        return MaterialPageRoute(builder: (_) => RegistrationSuccessScreen());
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
      case Routes.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
    }
    return null;
  }
}
