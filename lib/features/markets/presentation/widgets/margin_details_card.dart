import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarginDetailsCard extends StatelessWidget {
  const MarginDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (previous, current) =>
          previous.maxBuy != current.maxBuy ||
          previous.liquidationPrice != current.liquidationPrice ||
          previous.availableBalance != current.availableBalance ||
          previous.selectedMarginCoin != current.selectedMarginCoin,
      builder: (context, state) {
        final symbol = state.selectedMarginCoin?.symbol.toUpperCase() ?? '';
        final maxBuyText = '${state.maxBuy.toStringAsFixed(4)} $symbol';
        final liquidationPriceText =
            '${state.liquidationPrice.toStringAsFixed(2)} USDT';
        final balanceText = '${state.availableBalance.toStringAsFixed(2)} USDT';

        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.darkSurface,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.lightGrey.withValues(alpha: 0.1),
            ),
          ),
          child: Column(
            children: [
              MarginDetailRow(
                label: 'Available Balance',
                value: balanceText,
              ),
              verticalSpace(12),
              MarginDetailRow(label: 'Max Buy', value: maxBuyText),
              verticalSpace(12),
              MarginDetailRow(
                label: 'Liquidation Price',
                value: liquidationPriceText,
                isWarning: true,
              ),
            ],
          ),
        );
      },
    );
  }
}

class MarginDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isWarning;

  const MarginDetailRow({
    super.key,
    required this.label,
    required this.value,
    this.isWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppStyle.font14_400Weight.copyWith(color: AppColors.grey),
            ),
            if (isWarning) ...[
              horizontalSpace(4),
              Icon(
                Icons.warning_amber_rounded,
                color: AppColors.warning,
                size: 16.sp,
              ),
            ],
          ],
        ),
        Text(
          value,
          style: AppStyle.font14_700Weight.copyWith(
            color: isWarning ? AppColors.warning : AppColors.white,
          ),
        ),
      ],
    );
  }
}
