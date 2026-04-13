import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/enums/market_tab_type.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketCoinTrailingSection extends StatelessWidget {
  final CoinResponseModel coin;
  final MarketTabType tabType;
  final Color stateColor;

  const MarketCoinTrailingSection({
    super.key,
    required this.coin,
    required this.tabType,
    required this.stateColor,
  });

  @override
  Widget build(BuildContext context) {
    if (tabType == MarketTabType.convert) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.swap_horiz_rounded,
              color: AppColors.primary,
              size: 20.r,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          tabType == MarketTabType.fiat ? '\$1.00' : coin.formattedPrice,
          style: AppStyle.font16_600Weight.copyWith(color: AppColors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(4),
        Text(
          tabType == MarketTabType.fiat ? 'Stable' : coin.formattedChange,
          style: AppStyle.font12_400Weight.copyWith(
            color: tabType == MarketTabType.fiat
                ? AppColors.success.withValues(alpha: 0.8)
                : stateColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
