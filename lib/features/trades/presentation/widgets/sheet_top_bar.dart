import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SheetTopBar extends StatelessWidget {
  const SheetTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40.w,
          height: 4.h,
          margin: EdgeInsets.only(top: 8.h, bottom: 24.h),
          padding: EdgeInsets.only(bottom: 24.h),
          decoration: BoxDecoration(
            color: AppColors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'AVAILABLE:',
              style: AppStyle.font12_400Weight.copyWith(color: AppColors.grey),
            ),
            horizontalSpace(10),
            Text(
              '15.234164400',
              style: AppStyle.font12_400Weight.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            horizontalSpace(10),
            Text(
              'BUSD',
              style: AppStyle.font12_400Weight.copyWith(color: AppColors.grey),
            ),
            horizontalSpace(12),
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grey,
              ),
              child: Icon(Icons.add, size: 20.sp, color: AppColors.black),
            ),
          ],
        ),
        verticalSpace(16),
      ],
    );
  }
}
