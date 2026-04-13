import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/coin_sparkline_chart.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_coins_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketCoinMiddleSection extends StatelessWidget {
  final CoinResponseModel coin;
  final MarketTabType tabType;
  final Color stateColor;

  const MarketCoinMiddleSection({
    super.key,
    required this.coin,
    required this.tabType,
    required this.stateColor,
  });

  @override
  Widget build(BuildContext context) {
    if (tabType == MarketTabType.margin) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.orange.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: AppColors.orange.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          '10x',
          textAlign: TextAlign.center,
          style: AppStyle.font10_400Weight.copyWith(color: AppColors.orange),
        ),
      );
    }

    if (tabType == MarketTabType.spot) {
      return CoinSparklineChart(coin: coin, stateColor: stateColor);
    }

    return const SizedBox.shrink();
  }
}
