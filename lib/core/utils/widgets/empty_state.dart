import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.message,
    this.description,
    this.animationSize,
    this.withContainer = false,
    this.width,
    this.actionWidget,
  });

  final String message;
  final String? description;
  final double? animationSize;
  final bool withContainer;
  final double? width;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/animations/empty_state.json',
          height: animationSize ?? 180.h,
          width: animationSize ?? 200.w,
          fit: BoxFit.contain,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppStyle.font16_400Weight.copyWith(
            color: AppColors.darkBackground,
          ),
        ),
        if (description != null)
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 32.w, right: 32.w),
            child: Text(
              description!,
              textAlign: TextAlign.center,
              style: AppStyle.font14_400Weight.copyWith(
                color: Colors.grey[500],
              ),
            ),
          ),
        if (actionWidget != null)
          Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: actionWidget!,
          ),
      ],
    );

    if (withContainer) {
      return Container(
        width: width ?? double.infinity,
        margin: EdgeInsets.all(16.r),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.primary10,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: AppColors.lightGrey.withValues(alpha: 0.5),
            width: 1.w,
          ),
        ),
        child: content,
      );
    }

    return Center(child: content);
  }
}
