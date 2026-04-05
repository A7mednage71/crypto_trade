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
              style: AppStyle.font22_600Weight,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: isPositive
                    ? AppColors.primaryGreen.withValues(alpha: 0.1)
                    : AppColors.errorRed.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                '${isPositive ? '+' : ''}${change.toStringAsFixed(2)}%',
                style: AppStyle.font14_700Weight.copyWith(
                  color: isPositive
                      ? AppColors.primaryGreen
                      : AppColors.errorRed,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(16),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Low: ${currencyFormat.format(low)}',
                  style: AppStyle.font12_400Weight.copyWith(
                    color: AppColors.white.withValues(alpha: 0.6),
                  ),
                ),
                Text(
                  'High: ${currencyFormat.format(high)}',
                  style: AppStyle.font12_400Weight.copyWith(
                    color: AppColors.white.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            ClipRRect(
              borderRadius: BorderRadius.circular(2.r),
              child: LinearProgressIndicator(
                value: currentPos.clamp(0.0, 1.0),
                backgroundColor: Colors.white.withValues(alpha: 0.1),
                color: AppColors.primaryGreen,
                minHeight: 4.h,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
