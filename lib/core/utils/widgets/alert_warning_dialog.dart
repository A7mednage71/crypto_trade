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
  final void Function() onConfirmPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: BorderSide(color: AppColors.lightGrey, width: 1),
      ),
      title: Text(title, style: AppStyle.font22_600Weight),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/worning.json', height: 100.h),
          Text(subtitle, style: AppStyle.font18_400Weight),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            "cancel",
            style: AppStyle.font16_600Weight.copyWith(
              color: AppColors.lightGrey,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
