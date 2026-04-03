import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiquidationWarningBox extends StatelessWidget {
  const LiquidationWarningBox({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MarketsCubit>().state;
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.warning.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        // ignore: deprecated_member_use
        border: Border.all(color: AppColors.warning.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: AppColors.warning,
            size: 20.w,
          ),
          horizontalSpace(8),
          Text(
            'Liquidation Price',
            style: AppStyle.font14_400Weight.copyWith(color: AppColors.warning),
          ),
          const Spacer(),
          Text(
            '\$${state.liquidationPrice.toStringAsFixed(2)}',
            style: AppStyle.font16_600Weight.copyWith(color: AppColors.warning),
          ),
        ],
      ),
    );
  }
}
