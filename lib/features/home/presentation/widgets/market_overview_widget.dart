import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:crypto_trade/features/home/presentation/widgets/feature_promo_card.dart';
import 'package:crypto_trade/features/home/presentation/widgets/recent_coins_bloc_builder.dart';
import 'package:crypto_trade/features/home/presentation/widgets/top_coins_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          verticalSpace(16),
          const RecentCoinsBlocBuilder(),
          verticalSpace(16),
          const TopCoinsBlocBuilder(),
          verticalSpace(100),
        ],
      ),
    );
  }
}
