import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                Assets.imagesPngAccountCreatedSuccess,
                height: 200.h,
                fit: BoxFit.contain,
              ),
            ),
            verticalSpace(48),
            Text(
              "Your account has been successfully created!",
              textAlign: TextAlign.center,
              style: AppStyle.font32_500Weight.copyWith(height: 1.4),
            ),
            verticalSpace(40),
            CustomTextButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                // Navigate to main screen
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              text: "Get Started",
              background: AppColors.primary,
              height: 56.h,
              isUpperCase: false,
              customTextStyle: AppStyle.font18_400Weight.copyWith(
                color: AppColors.darkBackground,
              ),
              customBorderRadius: BorderRadius.circular(16.r),
            ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
