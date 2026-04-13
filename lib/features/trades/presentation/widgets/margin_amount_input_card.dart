import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/trades/presentation/cubits/margin_cubit/margin_cubit.dart';
import 'package:crypto_trade/features/trades/presentation/cubits/margin_cubit/margin_state.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/asset_exchange_card.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/coin_picker_sheet.dart';
import 'package:crypto_trade/features/wallets/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarginAmountInputCard extends StatelessWidget {
  const MarginAmountInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    final marginCubit = context.read<MarginCubit>();
    final myBalance = context.watch<WalletCubit>().state.myBalance;

    return BlocBuilder<MarginCubit, MarginState>(
      buildWhen: (previous, current) =>
          previous.amountToTrade != current.amountToTrade ||
          previous.leverage != current.leverage ||
          previous.selectedMarginCoin != current.selectedMarginCoin ||
          previous.actualOrderAmount != current.actualOrderAmount ||
          previous.totalOrderValueUSD != current.totalOrderValueUSD,
      builder: (context, state) {
        final isExceeded = state.amountToTrade > myBalance;
        final symbol = state.selectedMarginCoin?.symbol.toUpperCase() ?? '';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AssetExchangeCard(
              label: 'Amount to Trade',
              currency:
                  state.selectedMarginCoin?.symbol.toUpperCase() ?? 'Select',
              iconUrl: state.selectedMarginCoin?.image ?? '',
              controller: marginCubit.amountController,
              balance: '${myBalance.toStringAsFixed(2)} USDT',
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
    final marginCubit = context.read<MarginCubit>();
    final marketsCubit = context.read<MarketsCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: marginCubit),
          BlocProvider.value(value: marketsCubit),
        ],
        child: CoinPickerSheet(
          onCoinSelected: (coin) {
            marginCubit.selectMarginCoin(coin);
          },
        ),
      ),
    );
  }
}
