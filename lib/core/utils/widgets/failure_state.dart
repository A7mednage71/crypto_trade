import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FailureState extends StatelessWidget {
  const FailureState({
    super.key,
    required this.size,
    this.title,
    this.titleColor,
    this.message,
    this.onPressed,
    this.withContainer = false,
    this.isFullPage = false,
  });

  final double size;
  final String? title;
  final Color? titleColor;
  final String? message;
  final void Function()? onPressed;
  final bool withContainer;
  final bool isFullPage;

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/failure_state.json',
            height: size.h,
            width: size.w,
            fit: BoxFit.contain,
          ),
          verticalSpace(16),
          Text(
            title ?? "Oops! Something went wrong",
            style: AppStyle.font16_400Weight.copyWith(
              color: titleColor ?? AppColors.darkBackground,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(8),
          if (message != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                message!,
                style: AppStyle.font14_400Weight.copyWith(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          verticalSpace(12),
          if (onPressed != null)
            SizedBox(
              width: isFullPage ? 180.w : 120.w,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                  foregroundColor: AppColors.primary,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(
                      color: AppColors.primary.withValues(alpha: 0.3),
                    ),
                  ),
                ),
                child: Text(
                  "Try Again",
                  style: AppStyle.font14_700Weight.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );

    if (withContainer) {
      return Container(
        margin: EdgeInsets.all(16.r),
        padding: EdgeInsets.all(16.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.error16,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: content,
      );
    }

    return content;
  }
}
