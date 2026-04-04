import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpInputFields extends StatelessWidget {
  final void Function(String)? onCompleted;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const OtpInputFields({
    super.key,
    this.onCompleted,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 72.w,
      height: 72.h,
      textStyle: AppStyle.font24_700Weight.copyWith(color: AppColors.white),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primary, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: AppColors.darkSurface,
      ),
    );

    return Pinput(
      length: 6,
      controller: controller,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: true,
      onCompleted: onCompleted,
      validator: validator,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      pinAnimationType: PinAnimationType.fade,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12.h),
            width: 14.w,
            height: 2.h,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
