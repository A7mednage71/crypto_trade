import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:k_chart/flutter_k_chart.dart';

class MainKChartWidget extends StatelessWidget {
  const MainKChartWidget({super.key, required this.chartData});

  final List<KLineEntity> chartData;

  @override
  Widget build(BuildContext context) {
    if (chartData.isEmpty) return SizedBox();

    ChartColors chartColors = ChartColors();
    chartColors.upColor = AppColors.primary;
    chartColors.dnColor = AppColors.error;
    chartColors.bgColor = [AppColors.darkBackground, AppColors.darkBackground];
    chartColors.hCrossColor = AppColors.white.withValues(alpha: 0.5);
    chartColors.vCrossColor = AppColors.white.withValues(alpha: 0.1);
    chartColors.crossTextColor = AppColors.white;
    chartColors.defaultTextColor = AppColors.grey;
    chartColors.gridColor = Colors.transparent;
    chartColors.volColor = AppColors.primary.withValues(alpha: 0.2);
    chartColors.selectFillColor = AppColors.darkBackground.withValues(
      alpha: 0.9,
    );
    chartColors.selectBorderColor = AppColors.grey.withValues(alpha: 0.3);

    return KChartWidget(
      chartData,
      ChartStyle(),
      chartColors,
      isLine: false,
      isTrendLine: false,
      mainState: MainState.NONE,
      volHidden: false,
      secondaryState: SecondaryState.NONE,
      fixedLength: 2,
      isTapShowInfoDialog: true,
    );
  }
}
