import 'package:crypto_trade/core/export.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketAddFavoriteButton extends StatelessWidget {
  final VoidCallback? onTap;

  const MarketAddFavoriteButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          color: AppColors.grey.withValues(alpha: 0.3),
          strokeWidth: 1.5.w,
          dashPattern: const [6, 6],
          borderType: BorderType.RRect,
          radius: Radius.circular(12.r),
          child: Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.darkSurface.withValues(alpha: 5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: const BoxDecoration(
                    color: AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: AppColors.darkBackground,
                      size: 18.w,
                    ),
                  ),
                ),
                horizontalSpace(12),
                Text(
                  'Add Favorite',
                  style: AppStyle.font16_600Weight.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
