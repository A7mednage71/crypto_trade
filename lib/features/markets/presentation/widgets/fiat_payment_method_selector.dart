import 'package:crypto_trade/core/utils/enums/fiat_payment_method.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/fiat_payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiatPaymentMethodSelector extends StatelessWidget {
  const FiatPaymentMethodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (previous, current) =>
          previous.selectedPaymentMethodIndex !=
          current.selectedPaymentMethodIndex,
      builder: (context, state) {
        return SizedBox(
          height: 100.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: FiatPaymentMethod.values.length,
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final method = FiatPaymentMethod.values[index];
              final isSelected = state.selectedPaymentMethodIndex == index;
              return FiatPaymentMethodItem(
                method: method,
                isSelected: isSelected,
                onTap: () =>
                    context.read<MarketsCubit>().selectPaymentMethod(index),
              );
            },
          ),
        );
      },
    );
  }
}
