import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/features/home/data/models/coin_card_model.dart';
import 'package:crypto_trade/features/home/presentation/widgets/coin_section_widget.dart';
import 'package:crypto_trade/features/home/presentation/widgets/feature_promo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';

class MarketOverviewWidget extends StatelessWidget {
  const MarketOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          FeaturePromoCard(
            title: 'P2P Trading',
            subTitle: 'Bank Transfer, Paypal Revolut...',
            imagePath: Assets.imagesPngRocket,
            onTap: () {},
          ),
          FeaturePromoCard(
            title: 'Credit/Debit Card',
            subTitle: 'Visa, Mastercard',
            imagePath: Assets.imagesPngCredit,
            onTap: () {},
          ),
          verticalSpace(32),
          const CoinSectionWidget(
            title: 'Recent Coin',
            coins: CoinCardModel.recentCoins,
          ),
          verticalSpace(16),
          const CoinSectionWidget(
            title: 'Top Coins',
            coins: CoinCardModel.topCoins,
          ),
          verticalSpace(100),
        ],
      ),
    );
  }
}
