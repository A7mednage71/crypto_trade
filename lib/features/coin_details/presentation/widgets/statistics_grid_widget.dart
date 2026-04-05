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
        Text('Statistics', style: AppStyle.font18_600Weight),
        verticalSpace(16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
          childAspectRatio: 1.5,
          children: [
            StatisticsGridItem(
              label: 'Market Cap',
              value: currencyFormat.format(marketData.marketCap['usd'] ?? 0),
              icon: Icons.account_balance_wallet_outlined,
              glowColor: AppColors.neonGreen,
            ),
            StatisticsGridItem(
              label: '24h Volume',
              value: currencyFormat.format(marketData.totalVolume['usd'] ?? 0),
              icon: Icons.bar_chart_rounded,
              glowColor: AppColors.skyBlue,
            ),
            StatisticsGridItem(
              label: 'Circulating Supply',
              value: numberFormat.format(marketData.circulatingSupply ?? 0),
              icon: Icons.pie_chart_outline_rounded,
              glowColor: AppColors.warning,
            ),
            StatisticsGridItem(
              label: 'All-Time High',
              value: NumberFormat.currency(
                symbol: '\$',
              ).format(marketData.ath['usd'] ?? 0),
              icon: Icons.vertical_align_top_rounded,
              glowColor: AppColors.neonRed,
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
  final IconData icon;
  final Color glowColor;

  const StatisticsGridItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.darkSurface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.glassBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: glowColor.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: glowColor, size: 16.w),
          ),
          const Spacer(),
          Text(
            label,
            style: AppStyle.font13_400Weight.copyWith(
              color: AppColors.white.withValues(alpha: 0.4),
            ),
          ),
          verticalSpace(4),
          Text(
            value,
            style: AppStyle.font14_700Weight.copyWith(
              color: AppColors.white.withValues(alpha: 0.9),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
