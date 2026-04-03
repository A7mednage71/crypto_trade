import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/asset_exchange_card.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/coin_picker_sheet.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/convert_swap_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConvertTabBody extends StatefulWidget {
  const ConvertTabBody({super.key});

  @override
  State<ConvertTabBody> createState() => _ConvertTabBodyState();
}

class _ConvertTabBodyState extends State<ConvertTabBody> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    _fromController.addListener(() {
      if (_isUpdating) return;
      final amount = double.tryParse(_fromController.text) ?? 0;
      context.read<MarketsCubit>().updateConvertAmounts(
        isFromUpdate: true,
        amount: amount,
      );
    });

    _toController.addListener(() {
      if (_isUpdating) return;
      final amount = double.tryParse(_toController.text) ?? 0;
      context.read<MarketsCubit>().updateConvertAmounts(
        isFromUpdate: false,
        amount: amount,
      );
    });
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MarketsCubit, MarketsState>(
      listenWhen: (p, c) =>
          p.fromAmount != c.fromAmount || p.toAmount != c.toAmount,
      listener: (context, state) {
        _isUpdating = true;

        if (_fromController.text != state.fromAmount.toString()) {
          _fromController.text = state.fromAmount == 0
              ? ""
              : state.fromAmount.toStringAsFixed(6);
        }
        if (_toController.text != state.toAmount.toString()) {
          _toController.text = state.toAmount == 0
              ? ""
              : state.toAmount.toStringAsFixed(6);
        }

        _isUpdating = false;
      },
      child: BlocBuilder<MarketsCubit, MarketsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        AssetExchangeCard(
                          label: "From",
                          currency:
                              state.fromCoin?.symbol.toUpperCase() ?? "Select",
                          iconUrl: state.fromCoin?.image ?? "",
                          controller: _fromController,
                          balance: "0.450",
                          onCurrencyTap: () => _showCoinPicker(isFrom: true),
                        ),
                        verticalSpace(12),
                        AssetExchangeCard(
                          label: "To",
                          currency:
                              state.toCoin?.symbol.toUpperCase() ?? "Select",
                          iconUrl: state.toCoin?.image ?? "",
                          controller: _toController,
                          onCurrencyTap: () => _showCoinPicker(isFrom: false),
                        ),
                      ],
                    ),
                    ConvertSwapButton(),
                  ],
                ),
                verticalSpace(24),
                _buildRateInfo(state),
                const Spacer(),
                CustomTextButton(
                  onPressed: () {},
                  text: 'Preview Conversion',
                  disable: state.fromCoin == null || state.toCoin == null,
                  customTextStyle: AppStyle.font16_400Weight.copyWith(
                    color: state.fromCoin == null || state.toCoin == null
                        ? AppColors.lightGrey
                        : AppColors.white,
                  ),
                  disableColor: AppColors.grey,
                  height: 54.h,
                  customBorderRadius: BorderRadius.circular(16.r),
                ),
                verticalSpace(120),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRateInfo(MarketsState state) {
    return Row(
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
    );
  }

  void _showCoinPicker({required bool isFrom}) {
    final cubit = context.read<MarketsCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: CoinPickerSheet(
          onCoinSelected: (coin) {
            cubit.selectConvertCoin(isFrom: isFrom, coin: coin);
          },
        ),
      ),
    );
  }
}
