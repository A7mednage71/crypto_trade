import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/enums/coin_timeframe.dart';
import 'package:crypto_trade/features/coin_details/data/models/market_chart_response_model.dart';
import 'package:crypto_trade/features/coin_details/presentation/cubits/coin_details_cubit/coin_details_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: AppColors.primaryGreen,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryGreen.withValues(alpha: 0.3),
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
        verticalSpace(16),
        Row(
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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryGreen
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  tf.label,
                  style: AppStyle.font12_400Weight.copyWith(
                    color: isSelected
                        ? AppColors.black
                        : AppColors.white.withValues(alpha: 0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
