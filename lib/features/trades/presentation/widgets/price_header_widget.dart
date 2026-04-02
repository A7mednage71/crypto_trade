import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceHeaderWidget extends StatelessWidget {
  const PriceHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '40,059.83',
              style: AppStyle.font32_600Weight.copyWith(
                color: AppColors.white,
                letterSpacing: -0.5,
              ),
            ),
            horizontalSpace(10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                '+0.81%',
                style: AppStyle.font12_400Weight.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              Assets.imagesSvgConvert,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
            ),
            horizontalSpace(6),
            Text(
              'BTC/BUSD',
              style: AppStyle.font13_400Weight.copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
