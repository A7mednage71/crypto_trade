import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/enums/coin_timeframe.dart';
import 'package:crypto_trade/features/coin_details/data/models/market_chart_response_model.dart';
import 'package:crypto_trade/features/coin_details/presentation/cubits/coin_details_cubit/coin_details_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CoinChartWidget extends StatefulWidget {
  final String coinId;
  final MarketChartResponseModel chartData;

  const CoinChartWidget({
    super.key,
    required this.coinId,
    required this.chartData,
  });

  @override
  State<CoinChartWidget> createState() => _CoinChartWidgetState();
}

class _CoinChartWidgetState extends State<CoinChartWidget> {
  CoinTimeframe selectedTimeframe = CoinTimeframe.day1;

  @override
  Widget build(BuildContext context) {
    final spots = widget.chartData.prices
        .map((p) => FlSpot(p[0], p[1]))
        .toList();

    return Column(
      children: [
        Skeleton.replace(
          width: double.infinity,
          height: 250.h,
          child: SizedBox(
            height: 250.h,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (_) =>
                        AppColors.darkSurface.withValues(alpha: 0.8),
                    tooltipRoundedRadius: 8.r,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          'Price: \$${spot.y.toStringAsFixed(2)}\nTime: ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(spot.x.toInt()))}',
                          AppStyle.font12_400Weight.copyWith(
                            color: Colors.white,
                          ),
                        );
                      }).toList();
                    },
                  ),
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> indicators) {
                        return indicators.map((int index) {
                          return TouchedSpotIndicatorData(
                            FlLine(
                              color: AppColors.primaryGreen.withValues(
                                alpha: 0.2,
                              ),
                              strokeWidth: 1.5,
                              dashArray: [5, 5],
                            ),
                            FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, barData, index) =>
                                  FlDotCirclePainter(
                                    radius: 5,
                                    color: AppColors.primaryGreen,
                                    strokeWidth: 1.5,
                                    strokeColor: Colors.white,
                                  ),
                            ),
                          );
                        }).toList();
                      },
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    curveSmoothness: 0.35,
                    color: AppColors.primaryGreen,
                    barWidth: 2.5.w,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryGreen.withValues(alpha: 0.2),
                          AppColors.primaryGreen.withValues(alpha: 0.02),
                          AppColors.primaryGreen.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        verticalSpace(24),
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.darkSurface.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: AppColors.glassBorder, width: 0.8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: CoinTimeframe.values.map((tf) {
              final bool isSelected = selectedTimeframe == tf;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTimeframe = tf;
                  });
                  context.read<CoinDetailsCubit>().changeTimeframe(
                    widget.coinId,
                    tf.days,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryGreen
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    tf.label,
                    style: AppStyle.font12_400Weight.copyWith(
                      color: isSelected
                          ? AppColors.black
                          : AppColors.white.withValues(alpha: 0.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
