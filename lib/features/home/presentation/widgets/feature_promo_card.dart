import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturePromoCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;
  final VoidCallback onTap;

  const FeaturePromoCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.lightBackground.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.darkBackground,
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.rocket_launch,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyle.font16_400Weight.copyWith(
                      color: AppColors.darkBackground,
                    ),
                  ),
                  verticalSpace(4),
                  Text(
                    subTitle,
                    style: AppStyle.font12_400Weight.copyWith(
                      color: AppColors.lightGrey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.grey.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.darkBackground,
                size: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
