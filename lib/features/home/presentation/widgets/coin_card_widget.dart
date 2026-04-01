import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinCardWidget extends StatelessWidget {
  final CoinResponseModel coin;

  const CoinCardWidget({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final Color stateColor = coin.isPositive
        ? AppColors.primary
        : AppColors.error;
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
            left: 10,
            right: 10,
            bottom: 10,
            child: SizedBox(
              height: 30.h,
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
                        coin.formattedPrice,
                        style: AppStyle.font16_600Weight.copyWith(
                          color: stateColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    horizontalSpace(8),
                    Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CustomNetworkImage(
                        imageUrl: coin.image,
                        height: 24.h,
                        width: 24.w,
                        fit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                RichText(
                  text: TextSpan(
                    text: '${coin.symbol.toUpperCase()}/USD',
                    style: AppStyle.font14_400Weight.copyWith(
                      color: AppColors.darkBackground,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: '  ${coin.formattedChange}',
                        style: AppStyle.font14_400Weight.copyWith(
                          color: stateColor,
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
