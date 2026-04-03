import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/core/utils/enums/margin_mode.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarginHeaderSelector extends StatelessWidget {
  const MarginHeaderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final marketsCubit = context.read<MarketsCubit>();
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (previous, current) =>
          previous.marginMode != current.marginMode,
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: AppColors.darkSurface,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: MarginModeItem(
                  label: MarginMode.cross.name,
                  isSelected: state.marginMode == MarginMode.cross,
                  onTap: () => marketsCubit.changeMarginMode(MarginMode.cross),
                ),
              ),
              horizontalSpace(4),
              Expanded(
                child: MarginModeItem(
                  label: MarginMode.isolated.name,
                  isSelected: state.marginMode == MarginMode.isolated,
                  onTap: () =>
                      marketsCubit.changeMarginMode(MarginMode.isolated),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MarginModeItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const MarginModeItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.lightGrey.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppStyle.font14_700Weight.copyWith(
            color: isSelected ? AppColors.primary : AppColors.grey,
          ),
        ),
      ),
    );
  }
}
