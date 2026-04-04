import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/otp_input_fields.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/resend_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationScreen extends StatelessWidget {
  final String phoneNumber;

  const VerificationScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: CustomAppBar(title: "Verification", centerTitle: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(40),
            Text("Enter your code", style: AppStyle.font32_500Weight),
            verticalSpace(12),
            RichText(
              text: TextSpan(
                style: AppStyle.font14_400Weight.copyWith(
                  color: AppColors.grey.withValues(alpha: 0.8),
                  height: 1.5,
                ),
                children: [
                  const TextSpan(text: "Please type the code we sent to  "),
                  TextSpan(
                    text: phoneNumber,
                    style: AppStyle.font14_700Weight.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(48),
            OtpInputFields(),
            verticalSpace(32),
            ResendOtp(),
            verticalSpace(40),
            CustomTextButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                context.pushNamed(Routes.authScreen);
              },
              text: "Continue",
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
