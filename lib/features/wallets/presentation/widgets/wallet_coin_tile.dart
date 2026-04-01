import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/wallets/data/models/wallet_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletCoinTile extends StatelessWidget {
  final WalletCoinModel coin;
  final VoidCallback? onTap;

  const WalletCoinTile({super.key, required this.coin, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left: Icon
            Container(
              width: 40.w,
              height: 40.w,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: SvgPicture.asset(
                coin.iconPath,
                fit: BoxFit.contain,
              ),
            ),
            horizontalSpace(12),
            // Left: Name & Symbol
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
                    coin.symbol,
                    style: AppStyle.font12_400Weight.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Right: Price & Fiat
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    coin.price,
                    style: AppStyle.font16_600Weight.copyWith(
                      color: AppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(4),
                  Text(
                    coin.fiatBalance,
                    style: AppStyle.font12_400Weight.copyWith(
                      color: AppColors.grey,
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
