import 'dart:math';

import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/main_kchart_widget.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/price_header_widget.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/timeframe_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k_chart/flutter_k_chart.dart';

class TradingChartSection extends StatefulWidget {
  const TradingChartSection({super.key});

  @override
  State<TradingChartSection> createState() => _TradingChartSectionState();
}

class _TradingChartSectionState extends State<TradingChartSection> {
  late List<KLineEntity> mockData;

  @override
  void initState() {
    super.initState();
    mockData = _generateMockCandles();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: PriceHeaderWidget(),
        ),
        verticalSpace(16),
        SizedBox(
          height: 320.h,
          child: MainKChartWidget(chartData: mockData),
        ),
        verticalSpace(8),
        TimeframeSelectorWidget(),
      ],
    );
  }

  List<KLineEntity> _generateMockCandles() {
    Random rng = Random();
    List<KLineEntity> candles = [];
    double price = 40000;

    for (int i = 0; i < 50; i++) {
      double open = price;
      double close = price + (rng.nextDouble() * 400 - 200);
      double high = max(open, close) + rng.nextDouble() * 100;
      double low = min(open, close) - rng.nextDouble() * 100;

      candles.add(
        KLineEntity.fromCustom(
          open: open,
          close: close,
          high: high,
          low: low,
          vol: rng.nextDouble() * 1000,
          amount: rng.nextDouble() * 10000,
          time: DateTime.now()
              .subtract(Duration(minutes: 50 - i))
              .millisecondsSinceEpoch,
        ),
      );
      price = close;
    }

    DataUtil.calculate(candles);
    return candles;
  }
}
