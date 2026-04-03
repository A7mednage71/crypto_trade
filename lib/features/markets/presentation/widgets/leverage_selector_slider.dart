import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeverageSelectorSlider extends StatelessWidget {
  const LeverageSelectorSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (previous, current) => previous.leverage != current.leverage,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Leverage',
                  style: AppStyle.font14_400Weight.copyWith(color: AppColors.grey),
                ),
                Text(
                  '${state.leverage.toInt()}x',
                  style: AppStyle.font14_700Weight.copyWith(color: AppColors.primary),
                ),
              ],
            ),
            verticalSpace(8),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.darkSurface,
                thumbColor: AppColors.primary,
                overlayColor: AppColors.primary.withValues(alpha: 0.2),
                valueIndicatorColor: AppColors.primary,
                valueIndicatorTextStyle: AppStyle.font12_600Weight,
                trackHeight: 4.h,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 16.r),
              ),
              child: Slider(
                value: state.leverage,
                min: 1.0,
                max: 20.0,
                divisions: 19,
                label: '${state.leverage.toInt()}x',
                onChanged: (value) {
                  context.read<MarketsCubit>().changeLeverage(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeverageLabel(label: '1x'),
                  LeverageLabel(label: '5x'),
                  LeverageLabel(label: '10x'),
                  LeverageLabel(label: '15x'),
                  LeverageLabel(label: '20x'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class LeverageLabel extends StatelessWidget {
  final String label;

  const LeverageLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppStyle.font12_400Weight.copyWith(color: AppColors.grey),
    );
  }
}
