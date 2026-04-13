import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/widgets/app_status_dialog.dart';
import 'package:crypto_trade/features/activity/data/models/activity_model.dart';
import 'package:crypto_trade/features/activity/presentation/cubits/activity_cubit/activity_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/trades/presentation/cubits/convert_cubit/convert_cubit.dart';
import 'package:crypto_trade/features/trades/presentation/cubits/convert_cubit/convert_state.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/asset_exchange_card.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/coin_picker_sheet.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/convert_swap_button.dart';
import 'package:crypto_trade/features/wallets/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeConvertTabBody extends StatelessWidget {
  const TradeConvertTabBody({super.key});

  void _handleSuccess(BuildContext context, ConvertState state) {
    context.read<WalletCubit>().deductBalance(state.fromAmount);

    AppStatusDialog.show(
      context,
      isSuccess: true,
      title: 'Conversion Successful',
      message: state.message ?? 'Conversion successful.',
      onDone: () {
        context.read<ActivityCubit>().log(
          type: ActivityType.swap,
          symbol:
              '${state.fromCoin!.symbol.toUpperCase()} ➔ ${state.toCoin!.symbol.toUpperCase()}',
          name: 'Currency Swap',
          amount: state.fromAmount,
          price: state.rate,
        );

        context.read<ConvertCubit>().resetConvertStatus();
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConvertCubit, ConvertState>(
      listenWhen: (p, c) => p.convertStatus != c.convertStatus,
      listener: (context, state) {
        if (state.convertStatus == ConvertStatus.success) {
          _handleSuccess(context, state);
        }
      },
      builder: (context, state) {
        final bool isButtonDisabled =
            state.fromCoin == null ||
            state.toCoin == null ||
            state.fromAmount <= 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            children: [
              _buildExchangeCards(context, state),
              verticalSpace(24),
              _buildRateIndicator(state, isButtonDisabled),
              const Spacer(),
              _buildConvertButton(context, state, isButtonDisabled),
              verticalSpace(120),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExchangeCards(BuildContext context, ConvertState state) {
    final convertCubit = context.read<ConvertCubit>();
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            AssetExchangeCard(
              label: "From",
              currency: state.fromCoin?.symbol.toUpperCase() ?? "Select",
              iconUrl: state.fromCoin?.image ?? "",
              controller: convertCubit.fromController,
              balance: context
                  .watch<WalletCubit>()
                  .state
                  .myBalance
                  .toStringAsFixed(2),
              onCurrencyTap: () => _showCoinPicker(context, isFrom: true),
            ),
            verticalSpace(12),
            AssetExchangeCard(
              label: "To",
              currency: state.toCoin?.symbol.toUpperCase() ?? "Select",
              iconUrl: state.toCoin?.image ?? "",
              controller: convertCubit.toController,
              onCurrencyTap: () => _showCoinPicker(context, isFrom: false),
            ),
          ],
        ),
        const ConvertSwapButton(),
      ],
    );
  }

  Widget _buildRateIndicator(ConvertState state, bool isDisabled) {
    return Visibility(
      visible: !isDisabled,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rate',
            style: AppStyle.font16_400Weight.copyWith(color: AppColors.grey),
          ),
          Text(
            '1 ${state.fromCoin?.symbol.toUpperCase()} ≈ ${state.rate.toStringAsFixed(4)} ${state.toCoin?.symbol.toUpperCase()}',
            style: AppStyle.font13_400Weight.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConvertButton(
    BuildContext context,
    ConvertState state,
    bool isDisabled,
  ) {
    return CustomTextButton(
      isLoading: state.convertStatus == ConvertStatus.loading,
      onPressed: () => context.read<ConvertCubit>().executeConvert(),
      text: 'Convert',
      disable: isDisabled,
      customTextStyle: AppStyle.font16_400Weight.copyWith(
        color: isDisabled ? AppColors.lightGrey : AppColors.white,
      ),
      disableColor: AppColors.grey,
      height: 54.h,
      customBorderRadius: BorderRadius.circular(16.r),
    );
  }

  void _showCoinPicker(BuildContext context, {required bool isFrom}) {
    final convertCubit = context.read<ConvertCubit>();
    final marketsCubit = context.read<MarketsCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: convertCubit),
          BlocProvider.value(value: marketsCubit),
        ],
        child: CoinPickerSheet(
          onCoinSelected: (coin) {
            convertCubit.selectConvertCoin(isFrom: isFrom, coin: coin);
          },
        ),
      ),
    );
  }
}
