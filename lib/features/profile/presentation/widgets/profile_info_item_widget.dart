import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoItemWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool showDivider;
  final VoidCallback? onTap;

  const ProfileInfoItemWidget({
    super.key,
    required this.label,
    required this.value,
    this.showDivider = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          splashColor: AppColors.primary.withValues(alpha: 0.08),
          highlightColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: AppStyle.font16_400Weight.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: Text(
                    value,
                    style: AppStyle.font14_400Weight.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.primary,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1.h,
            thickness: 0.4,
            color: AppColors.grey.withValues(alpha: 0.2),
          ),
      ],
    );
  }
}
