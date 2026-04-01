import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/markets/data/models/market_coin_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarketCoinTile extends StatelessWidget {
  final MarketCoinModel coin;
  final VoidCallback? onTap;

  const MarketCoinTile({super.key, required this.coin, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: SvgPicture.asset(coin.iconPath, fit: BoxFit.contain),
            ),
            horizontalSpace(12),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    coin.name,
                    style: AppStyle.font16_600Weight.copyWith(
                      color: AppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Text(
                    coin.symbol,
                    style: AppStyle.font12_400Weight.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SizedBox(
                  height: 35.h,
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: const FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineTouchData: const LineTouchData(enabled: false),
                      minX: 0,
                      maxX: 9,
                      minY: 0,
                      maxY: 10,
                      lineBarsData: [
                        LineChartBarData(
                          spots: coin.sparklineData,
                          isCurved: true,
                          color: coin.isPositive
                              ? AppColors.primary
                              : AppColors.error,
                          barWidth: 1.5.w,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                (coin.isPositive
                                        ? AppColors.primary
                                        : AppColors.error)
                                    .withValues(alpha: 0.3),
                                (coin.isPositive
                                        ? AppColors.primary
                                        : AppColors.error)
                                    .withValues(alpha: 0.0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    coin.price,
                    style: AppStyle.font16_600Weight.copyWith(
                      color: AppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Text(
                    coin.changePercentage,
                    style: AppStyle.font12_400Weight.copyWith(
                      color: coin.isPositive
                          ? AppColors.primary
                          : AppColors.error,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
