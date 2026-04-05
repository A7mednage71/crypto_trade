import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class StatisticsGridWidget extends StatelessWidget {
  final MarketDataModel marketData;

  const StatisticsGridWidget({super.key, required this.marketData});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.compactCurrency(symbol: '\$');
    final numberFormat = NumberFormat.compact();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistics',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.h),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 2.2,
          children: [
            StatisticsGridItem(
              label: 'Market Cap',
              value: currencyFormat.format(marketData.marketCap['usd'] ?? 0),
            ),
            StatisticsGridItem(
              label: '24h Volume',
              value: currencyFormat.format(marketData.totalVolume['usd'] ?? 0),
            ),
            StatisticsGridItem(
              label: 'Circulating Supply',
              value: numberFormat.format(marketData.circulatingSupply ?? 0),
            ),
            StatisticsGridItem(
              label: 'All-Time High',
              value: NumberFormat.currency(
                symbol: '\$',
              ).format(marketData.ath['usd'] ?? 0),
            ),
          ],
        ),
      ],
    );
  }
}

class StatisticsGridItem extends StatelessWidget {
  final String label;
  final String value;

  const StatisticsGridItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppStyle.font12_400Weight),
          SizedBox(height: 8.h),
          Text(value, style: AppStyle.font14_700Weight),
        ],
      ),
    );
  }
}
