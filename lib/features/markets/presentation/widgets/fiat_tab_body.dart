import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/core/utils/widgets/app_status_dialog.dart';
import 'package:crypto_trade/core/utils/widgets/custom_text_button.dart';
import 'package:crypto_trade/core/utils/widgets/custom_text_form_field.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/fiat_balance_card.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/fiat_payment_method_selector.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/fiat_quick_select_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiatTabBody extends StatefulWidget {
  const FiatTabBody({super.key});

  @override
  State<FiatTabBody> createState() => _FiatTabBodyState();
}

class _FiatTabBodyState extends State<FiatTabBody> {
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _amountController.addListener(_onAmountChanged);
  }

  void _onAmountChanged() {
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    context.read<MarketsCubit>().updateFiatAmount(amount);
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MarketsCubit, MarketsState>(
      listenWhen: (previous, current) =>
          previous.tradeStatus != current.tradeStatus ||
          previous.fiatDepositAmount != current.fiatDepositAmount,
      listener: (context, state) {
        // Sync controller from state (e.g. when chip is selected)
        final currentAmount = double.tryParse(_amountController.text) ?? 0.0;
        if (state.fiatDepositAmount != currentAmount) {
          _amountController.text = state.fiatDepositAmount == 0.0
              ? ''
              : state.fiatDepositAmount.toString();
        }
      },
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        children: [
          const FiatBalanceCard(),
          verticalSpace(32),
          Text('Select Amount', style: AppStyle.font16_600Weight),
          verticalSpace(16),
          FiatQuickSelectGrid(),
          verticalSpace(24),
          Text('Custom Amount', style: AppStyle.font16_600Weight),
          verticalSpace(12),
          CustomTextFormField(
            controller: _amountController,
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            hint: 'Enter amount (USD)',
            bgColor: AppColors.darkSurface,
            borderColor: AppColors.primary,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 16.w,
            ),
            suffixIcon: Icon(
              Icons.attach_money_rounded,
              color: AppColors.primary,
              size: 20.r,
            ),
          ),
          verticalSpace(32),
          Text('Payment Method', style: AppStyle.font16_600Weight),
          verticalSpace(16),
          const FiatPaymentMethodSelector(),
          verticalSpace(40),
          _DepositButton(),
          verticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.security_rounded,
                color: AppColors.success.withValues(alpha: 0.6),
                size: 16.r,
              ),
              horizontalSpace(8),
              Text(
                'Funds are protected by SSL encryption.',
                style: AppStyle.font12_400Weight.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          verticalSpace(100),
        ],
      ),
    );
  }
}

class _DepositButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MarketsCubit>();
    return BlocConsumer<MarketsCubit, MarketsState>(
      listenWhen: (previous, current) =>
          previous.tradeStatus != current.tradeStatus,
      listener: (context, state) {
        if (state.tradeStatus == TradeStatus.success) {
          AppStatusDialog.show(
            context,
            isSuccess: true,
            title: 'Deposit Success',
            message: 'Your funds have been added successfully.',
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.tradeStatus != current.tradeStatus ||
          previous.fiatDepositAmount != current.fiatDepositAmount,
      builder: (context, state) {
        final isLoading = state.tradeStatus == TradeStatus.loading;
        final isDisabled = state.fiatDepositAmount <= 0;

        return CustomTextButton(
          onPressed: () => cubit.depositFiat(state.fiatDepositAmount),
          text: 'Confirm Deposit',
          isLoading: isLoading,
          disable: isDisabled,
          disableColor: AppColors.grey.withValues(alpha: 0.2),
          background: AppColors.primary,
          height: 52.h,
          isUpperCase: false,
          customTextStyle: AppStyle.font16_600Weight,
          customBorderRadius: BorderRadius.circular(16.r),
        );
      },
    );
  }
}
