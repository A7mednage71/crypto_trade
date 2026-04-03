import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/asset_exchange_card.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/coin_picker_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarginAmountInputCard extends StatefulWidget {
  const MarginAmountInputCard({super.key});

  @override
  State<MarginAmountInputCard> createState() => _MarginAmountInputCardState();
}

class _MarginAmountInputCardState extends State<MarginAmountInputCard> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_onAmountChanged);
  }

  void _onAmountChanged() {
    final amount = double.tryParse(_controller.text) ?? 0.0;
    context.read<MarketsCubit>().updateMarginAmount(amount);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (previous, current) =>
          previous.amountToTrade != current.amountToTrade ||
          previous.leverage != current.leverage ||
          previous.selectedMarginCoin != current.selectedMarginCoin ||
          previous.availableBalance != current.availableBalance ||
          previous.actualOrderAmount != current.actualOrderAmount ||
          previous.totalOrderValueUSD != current.totalOrderValueUSD,
      builder: (context, state) {
        final isExceeded = state.amountToTrade > state.availableBalance;
        final symbol = state.selectedMarginCoin?.symbol.toUpperCase() ?? '';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AssetExchangeCard(
              label: 'Amount to Trade',
              currency:
                  state.selectedMarginCoin?.symbol.toUpperCase() ?? 'Select',
              iconUrl: state.selectedMarginCoin?.image ?? '',
              controller: _controller,
              balance: '${state.availableBalance.toStringAsFixed(2)} USDT',
              borderColor: isExceeded ? AppColors.danger : null,
              onCurrencyTap: () => _showCoinPicker(context),
            ),
            verticalSpace(8),
            Text(
              'Total Order: ≈ \$${state.totalOrderValueUSD.toStringAsFixed(2)} (${state.actualOrderAmount.toStringAsFixed(6)} $symbol)',
              style: AppStyle.font12_400Weight.copyWith(
                color: isExceeded ? AppColors.danger : AppColors.grey,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCoinPicker(BuildContext context) {
    final cubit = context.read<MarketsCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: CoinPickerSheet(
          onCoinSelected: (coin) {
            cubit.selectMarginCoin(coin);
          },
        ),
      ),
    );
  }
}
