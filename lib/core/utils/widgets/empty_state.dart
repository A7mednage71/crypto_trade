import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.message,
    this.value,
    this.withContainer = false,
    this.width,
  });
  final String message;
  final double? value;
  final bool withContainer;
  final double? width;
  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/animations/empty_state.json',
          height: value ?? 150.h,
          width: value ?? 200.w,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppStyle.font18_600Weight,
        ),
      ],
    );

    return withContainer
        ? Container(
            width: width ?? double.infinity,
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.sp)),
              border: Border.all(color: AppColors.lightGrey, width: 1.w),
            ),
            child: content,
          )
        : content;
  }
}
