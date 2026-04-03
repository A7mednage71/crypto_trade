import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/core/utils/enums/fiat_quick_amount.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiatQuickSelectGrid extends StatelessWidget {
  const FiatQuickSelectGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MarketsCubit>();
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (previous, current) =>
          previous.fiatDepositAmount != current.fiatDepositAmount,
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 2.2,
          ),
          itemCount: FiatQuickAmount.values.length,
          itemBuilder: (context, index) {
            final quickAmount = FiatQuickAmount.values[index];
            final isSelected = state.fiatDepositAmount == quickAmount.value;

            return FiatQuickSelectItem(
              onTap: () {
                cubit.updateFiatAmount(quickAmount.value);
              },
              isSelected: isSelected,
              quickAmount: quickAmount,
            );
          },
        );
      },
    );
  }
}

class FiatQuickSelectItem extends StatelessWidget {
  const FiatQuickSelectItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.quickAmount,
  });

  final void Function()? onTap;
  final bool isSelected;
  final FiatQuickAmount quickAmount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : AppColors.darkSurface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5.w,
          ),
        ),
        child: Text(
          quickAmount.label,
          style: AppStyle.font14_400Weight.copyWith(
            color: isSelected ? AppColors.primary : AppColors.grey,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
