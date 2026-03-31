import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coin_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinCardWidget extends StatelessWidget {
  final CoinCardModel coin;

  const CoinCardWidget({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 50.h,
              child: SvgPicture.asset(
                coin.sparklineChartPath,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  coin.isPositive
                      ? AppColors.primary.withValues(alpha: 0.5)
                      : AppColors.error.withValues(alpha: 0.5),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        coin.price,
                        style: AppStyle.font18_600Weight.copyWith(
                          color: coin.isPositive
                              ? AppColors.primary
                              : AppColors.error,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    horizontalSpace(8),
                    Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        coin.iconPath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                RichText(
                  text: TextSpan(
                    text: coin.pair,
                    style: AppStyle.font13_400Weight.copyWith(
                      color: AppColors.darkBackground,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: ' ${coin.change}',
                        style: AppStyle.font13_400Weight.copyWith(
                          color: coin.isPositive
                              ? AppColors.primary
                              : AppColors.error,
                        ),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
