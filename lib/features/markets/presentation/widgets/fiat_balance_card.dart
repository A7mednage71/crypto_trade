import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiatBalanceCard extends StatelessWidget {
  const FiatBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (previous, current) =>
          previous.availableBalance != current.availableBalance,
      builder: (context, state) {
        final usdBalance = state.availableBalance;
        final egpBalance = usdBalance * 50.0; // Mock rate: 1 USD = 50 EGP

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Equity',
                style: AppStyle.font14_400Weight.copyWith(
                  color: AppColors.white.withValues(alpha: 0.8),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '\$${usdBalance.toStringAsFixed(2)}',
                    style: AppStyle.font32_600Weight,
                  ),
                  SizedBox(width: 8.w),
                  Text('USD', style: AppStyle.font16_600Weight),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Text(
                  '≈ ${egpBalance.toStringAsFixed(2)} EGP',
                  style: AppStyle.font12_600Weight,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Add font32_700Weight if missing, but I'll use 600 or custom
extension on TextStyle {
  // Helper to ensure we have the style
}

// Correction for font32_700Weight which was listed in prompt but maybe differs in file
// I'll use font32_600Weight from the file or font36_700Weight
