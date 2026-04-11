import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyFavoritesView extends StatelessWidget {
  const EmptyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.05),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Icon(
                Icons.star_outline_rounded,
                size: 80.r,
                color: AppColors.primary.withValues(alpha: 0.6),
              ),
            ),
            verticalSpace(40),
            Text(
              'Your Favorites is Empty',
              style: AppStyle.font20_700Weight.copyWith(
                color: AppColors.white,
                letterSpacing: 0.5,
              ),
            ),
            verticalSpace(12),
            Text(
              'Start tracking your favorite coins to see them here and stay updated on their performance.',
              style: AppStyle.font14_400Weight.copyWith(
                color: AppColors.grey.withValues(alpha: 0.8),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
