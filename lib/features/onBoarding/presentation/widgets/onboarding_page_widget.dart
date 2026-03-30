import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/onBoarding/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Image.asset(
              page.image,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
        ),
        verticalSpace(30),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  page.title,
                  style: AppStyle.font24_400Weight,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(24),
                Text(
                  page.subTitle,
                  style: AppStyle.font18_400Weight.copyWith(
                    color: AppColors.grey,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
