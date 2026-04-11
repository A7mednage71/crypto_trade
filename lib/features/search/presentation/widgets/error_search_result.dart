import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/core/utils/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorSearchResult extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;

  const ErrorSearchResult({super.key, this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 64.r,
              color: AppColors.error.withValues(alpha: 0.5),
            ),
            verticalSpace(16),
            Text(
              'Something went wrong',
              style: AppStyle.font16_600Weight,
              textAlign: TextAlign.center,
            ),
            verticalSpace(8),
            Text(
              message ?? 'Failed to connect. Please check your connection.',
              style: AppStyle.font13_400Weight.copyWith(color: AppColors.grey),
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            CustomTextButton(
              onPressed: onRetry,
              text: 'Try Again',
              width: 160.w,
              background: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
