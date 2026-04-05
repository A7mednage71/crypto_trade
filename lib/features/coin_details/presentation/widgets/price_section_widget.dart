import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PriceSectionWidget extends StatelessWidget {
  final MarketDataModel marketData;

  const PriceSectionWidget({super.key, required this.marketData});

  @override
  Widget build(BuildContext context) {
    final double price = marketData.currentPrice['usd'] ?? 0.0;
    final double change = marketData.priceChangePercentage24h;
    final bool isPositive = change >= 0;
    final double high = marketData.high24h['usd'] ?? 0.0;
    final double low = marketData.low24h['usd'] ?? 0.0;
    final double currentPos = (price - low) / (high - low);

    final NumberFormat currencyFormat = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 2,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currencyFormat.format(price),
              style: AppStyle.font36_700Weight.copyWith(letterSpacing: -1),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: isPositive
                    ? AppColors.neonGreen.withValues(alpha: 0.08)
                    : AppColors.neonRed.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isPositive
                      ? AppColors.neonGreen.withValues(alpha: 0.2)
                      : AppColors.neonRed.withValues(alpha: 0.2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isPositive
                        ? AppColors.neonGreen.withValues(alpha: 0.1)
                        : AppColors.neonRed.withValues(alpha: 0.1),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    isPositive ? Icons.trending_up : Icons.trending_down,
                    color: isPositive ? AppColors.neonGreen : AppColors.neonRed,
                    size: 14.w,
                  ),
                  horizontalSpace(4),
                  Text(
                    '${isPositive ? '+' : ''}${change.toStringAsFixed(2)}%',
                    style: AppStyle.font14_700Weight.copyWith(
                      color: isPositive
                          ? AppColors.neonGreen
                          : AppColors.neonRed,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(24),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPriceMarker('L', currencyFormat.format(low)),
                _buildPriceMarker('H', currencyFormat.format(high)),
              ],
            ),
            verticalSpace(12),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 4.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.glassWhite.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final indicatorPos =
                        constraints.maxWidth * currentPos.clamp(0.0, 1.0);
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 4.h,
                          width: indicatorPos,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0x2200C076),
                                AppColors.primaryGreen,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(2.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryGreen.withValues(
                                  alpha: 0.2,
                                ),
                                blurRadius: 6,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: (indicatorPos - 5.w).clamp(
                            0.0,
                            constraints.maxWidth - 10.w,
                          ),
                          top: -3.h,
                          child: Container(
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreen,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryGreen.withValues(
                                    alpha: 0.4,
                                  ),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceMarker(String label, String value) {
    return Column(
      crossAxisAlignment: label == 'L'
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            if (label == 'H') horizontalSpace(4),
            Container(
              width: 16.w,
              height: 16.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: label == 'L'
                    ? AppColors.neonRed.withValues(alpha: 0.1)
                    : AppColors.neonGreen.withValues(alpha: 0.1),
                border: Border.all(
                  color:
                      (label == 'L' ? AppColors.neonRed : AppColors.neonGreen)
                          .withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: label == 'L'
                        ? AppColors.neonRed
                        : AppColors.neonGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (label == 'L') horizontalSpace(4),
            Text(
              value,
              style: AppStyle.font12_400Weight.copyWith(
                color: AppColors.white.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
