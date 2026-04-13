import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/core/utils/enums/market_tab_type.dart';
import 'package:crypto_trade/core/utils/widgets/custom_cache_network_image.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/coin_quick_actions_sheet.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_coin_middle_section.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_coin_trailing_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketCoinTile extends StatelessWidget {
  final CoinResponseModel coin;
  final MarketTabType tabType;

  const MarketCoinTile({super.key, required this.coin, required this.tabType});

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
          builder: (context) =>
              CoinQuickActionsSheet(coin: coin, tabType: tabType),
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          coin.name,
                          style: AppStyle.font16_600Weight.copyWith(
                            color: AppColors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (tabType == MarketTabType.fiat) ...[
                        horizontalSpace(4),
                        Icon(
                          Icons.verified_rounded,
                          size: 14.r,
                          color: AppColors.success,
                        ),
                      ],
                    ],
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
                child: MarketCoinMiddleSection(
                  coin: coin,
                  tabType: tabType,
                  stateColor: stateColor,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: MarketCoinTrailingSection(
                coin: coin,
                tabType: tabType,
                stateColor: stateColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
