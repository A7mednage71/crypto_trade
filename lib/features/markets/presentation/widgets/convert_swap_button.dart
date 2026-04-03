import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConvertSwapButton extends StatelessWidget {
  const ConvertSwapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<MarketsCubit>().swapConvertCurrencies();
      },
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.darkBackground, width: 4.w),
        ),
        child: Icon(
          Icons.swap_vert_rounded,
          color: AppColors.white,
          size: 24.sp,
        ),
      ),
    );
  }
}
