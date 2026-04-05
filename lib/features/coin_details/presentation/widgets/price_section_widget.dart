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
                    ? AppColors.primaryGreen.withValues(alpha: 0.1)
                    : AppColors.errorRed.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(
                    isPositive ? Icons.trending_up : Icons.trending_down,
                    color: isPositive
                        ? AppColors.primaryGreen
                        : AppColors.errorRed,
                    size: 14.w,
                  ),
                  horizontalSpace(4),
                  Text(
                    '${isPositive ? '+' : ''}${change.toStringAsFixed(2)}%',
                    style: AppStyle.font14_700Weight.copyWith(
                      color: isPositive
                          ? AppColors.primaryGreen
                          : AppColors.errorRed,
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
                _buildSimpleMarker('Low', currencyFormat.format(low)),
                _buildSimpleMarker('High', currencyFormat.format(high)),
              ],
            ),
            verticalSpace(12),
            Stack(
              children: [
                Container(
                  height: 4.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final indicatorPos =
                        constraints.maxWidth * currentPos.clamp(0.0, 1.0);
                    return Container(
                      height: 4.h,
                      width: indicatorPos,
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
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

  Widget _buildSimpleMarker(String label, String value) {
    return Column(
      crossAxisAlignment: label == 'Low'
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: AppStyle.font12_400Weight.copyWith(
            color: AppColors.white.withValues(alpha: 0.4),
          ),
        ),
        Text(
          value,
          style: AppStyle.font13_400Weight.copyWith(
            color: AppColors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
