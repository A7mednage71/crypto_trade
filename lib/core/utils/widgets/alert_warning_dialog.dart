import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AlertWarningDialog extends StatelessWidget {
  const AlertWarningDialog({
    super.key,
    required this.onConfirmPressed,
    required this.title,
    required this.subtitle,
    required this.buttonTitle,
  });

  final String title;
  final String subtitle;
  final String buttonTitle;
  final VoidCallback onConfirmPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.darkSurface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        // ignore: deprecated_member_use
        side: BorderSide(color: AppColors.grey.withAlpha(100), width: 1.w),
      ),
      title: Text(
        title,
        style: AppStyle.font22_600Weight.copyWith(color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/worning.json', height: 120.h),
          verticalSpace(10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppStyle.font18_400Weight.copyWith(color: AppColors.grey),
          ),
        ],
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "Cancel",
            style: AppStyle.font16_600Weight.copyWith(color: AppColors.grey),
          ),
        ),
        TextButton(
          onPressed: onConfirmPressed,
          child: Text(
            buttonTitle,
            style: AppStyle.font16_600Weight.copyWith(color: AppColors.error),
          ),
        ),
      ],
    );
  }
}
