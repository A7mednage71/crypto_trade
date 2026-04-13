import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinSparklineChart extends StatelessWidget {
  final CoinResponseModel coin;
  final Color stateColor;

  const CoinSparklineChart({
    super.key,
    required this.coin,
    required this.stateColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
