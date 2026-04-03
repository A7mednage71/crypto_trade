import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppStatusDialog extends StatelessWidget {
  final bool isSuccess;
  final String? message;

  const AppStatusDialog({super.key, required this.isSuccess, this.message});

  static void show(
    BuildContext context, {
    required bool isSuccess,
    String? title,
    String? message,
    VoidCallback? onDone,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
            side: BorderSide(color: AppColors.grey.withAlpha(100), width: 1.5),
          ),
          title: Text(
            title ?? (isSuccess ? 'Success' : 'Failed'),
            textAlign: TextAlign.center,
            style: AppStyle.font18_600Weight.copyWith(color: AppColors.white),
          ),
          contentPadding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 8.h),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpace(16),
              Lottie.asset(
                isSuccess
                    ? Assets.animationsSuccessState
                    : Assets.animationsFailureState,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.fill,
              ),
              verticalSpace(24),
              Text(
                message ??
                    (isSuccess
                        ? "Your process was completed successfully! 🎉"
                        : "Oops! Something went wrong. ❌"),
                textAlign: TextAlign.center,
                style: AppStyle.font14_400Weight.copyWith(
                  color: AppColors.grey,
                ),
              ),
              verticalSpace(16),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.lightGrey.withValues(alpha: 0.1),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(color: AppColors.grey.withAlpha(100)),
                  ),
                ),
                onPressed: onDone ?? () => Navigator.of(context).pop(),
                child: Text(
                  'Done',
                  style: AppStyle.font16_600Weight.copyWith(
                    color: isSuccess ? AppColors.success : AppColors.danger,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
