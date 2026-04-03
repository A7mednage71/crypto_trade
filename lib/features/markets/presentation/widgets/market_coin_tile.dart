import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/coin_quick_actions_sheet.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketCoinTile extends StatelessWidget {
  final CoinResponseModel coin;

  const MarketCoinTile({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final Color stateColor = coin.isPositive
        ? AppColors.primary
        : AppColors.error;

    return InkWell(
      onTap: () {
        HapticFeedback.mediumImpact();
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black.withValues(alpha: 0.5),
          isScrollControlled: true,
          builder: (context) => CoinQuickActionsSheet(coin: coin),
        );
      },
      borderRadius: BorderRadius.circular(12.r),

      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomNetworkImage(
              imageUrl: coin.image,
              height: 40.h,
              width: 40.w,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(40.r),
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
                    coin.symbol.toUpperCase(),
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
                      maxX: coin.sparklineSpots.length.toDouble() - 1,
                      lineBarsData: [
                        LineChartBarData(
                          spots: coin.sparklineSpots,
                          isCurved: true,
                          color: stateColor,
                          barWidth: 1.5.w,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                stateColor.withValues(alpha: 0.3),
                                stateColor.withValues(alpha: 0.0),
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
                    coin.formattedPrice,
                    style: AppStyle.font16_600Weight.copyWith(
                      color: AppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Text(
                    coin.formattedChange,
                    style: AppStyle.font12_400Weight.copyWith(
                      color: stateColor,
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
