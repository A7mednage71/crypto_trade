import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/asset_exchange_card.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/coin_picker_sheet.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/convert_swap_button.dart';
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

  String _fromCurrency = "BTC";
  String _fromIcon =
      "https://assets.coingecko.com/coins/images/1/large/bitcoin.png";
  String _toCurrency = "USDT";
  String _toIcon =
      "https://assets.coingecko.com/coins/images/325/large/Tether.png";

  void _onSwap() {
    setState(() {
      final tempCur = _fromCurrency;
      _fromCurrency = _toCurrency;
      _toCurrency = tempCur;

      final tempIcon = _fromIcon;
      _fromIcon = _toIcon;
      _toIcon = tempIcon;

      final tempVal = _fromController.text;
      _fromController.text = _toController.text;
      _toController.text = tempVal;
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
                    currency: _fromCurrency,
                    iconUrl: _fromIcon,
                    controller: _fromController,
                    balance: "0.450",
                    onCurrencyTap: () => _showCoinPicker(isFrom: true),
                  ),
                  verticalSpace(12),
                  AssetExchangeCard(
                    label: "To",
                    currency: _toCurrency,
                    iconUrl: _toIcon,
                    controller: _toController,
                    onCurrencyTap: () => _showCoinPicker(isFrom: false),
                  ),
                ],
              ),
              ConvertSwapButton(onTap: _onSwap),
            ],
          ),
          verticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rate',
                style: AppStyle.font16_400Weight.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                '1 $_fromCurrency ≈ 65,000 $_toCurrency',
                style: AppStyle.font13_400Weight.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomTextButton(
            onPressed: () {},
            text: 'Preview Conversion',
            isUpperCase: false,
            height: 54.h,
            customBorderRadius: BorderRadius.circular(16.r),
            customTextStyle: AppStyle.font16_400Weight.copyWith(
              color: AppColors.white,
            ),
          ),
          verticalSpace(120),
        ],
      ),
    );
  }

  void _showCoinPicker({required bool isFrom}) {
    final marketsCubit = context.read<MarketsCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider.value(
        value: marketsCubit,
        child: CoinPickerSheet(
          onCoinSelected: (coin) {
            if (isFrom) {
              if (coin.symbol.toUpperCase() == _toCurrency) {
                ShowToast.showFailureToast("Cannot select the same currency");
                return;
              }
              setState(() {
                _fromCurrency = coin.symbol.toUpperCase();
                _fromIcon = coin.image;
              });
            } else {
              if (coin.symbol.toUpperCase() == _fromCurrency) {
                ShowToast.showFailureToast("Cannot select the same currency");
                return;
              }
              setState(() {
                _toCurrency = coin.symbol.toUpperCase();
                _toIcon = coin.image;
              });
            }
          },
        ),
      ),
    );
  }
}
