import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarginRiskMeter extends StatelessWidget {
  const MarginRiskMeter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (previous, current) =>
          previous.riskPercentage != current.riskPercentage ||
          previous.riskLevel != current.riskLevel,
      builder: (context, state) {
        final riskLevel = state.riskLevel;
        final riskPercentage = state.riskPercentage;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Risk Level',
                  style: AppStyle.font14_400Weight.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  riskLevel.label,
                  style: AppStyle.font14_700Weight.copyWith(
                    color: riskLevel.color,
                  ),
                ),
              ],
            ),
            verticalSpace(12),
            SizedBox(
              height: 14.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 6.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.warning,
                          AppColors.error,
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(riskPercentage * 2 - 1, 0),
                    child: Container(
                      height: 14.h,
                      width: 3.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(2.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.3),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
