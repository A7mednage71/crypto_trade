import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConvertSwapButton extends StatelessWidget {
  const ConvertSwapButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.darkBackground, width: 4.w),
        ),
        child: Icon(
          Icons.swap_vert_rounded,
          color: AppColors.white,
          size: 24.sp,
        ),
      ),
    );
  }
}
