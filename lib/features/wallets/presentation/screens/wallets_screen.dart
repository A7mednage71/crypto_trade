import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/wallets/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:crypto_trade/features/wallets/presentation/cubits/wallet_cubit/wallet_state.dart';
import 'package:crypto_trade/features/wallets/presentation/widgets/wallet_action_buttons.dart';
import 'package:crypto_trade/features/wallets/presentation/widgets/wallet_balance_header.dart';
import 'package:crypto_trade/features/wallets/presentation/widgets/wallet_coin_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WalletBalanceHeader(),
            const WalletActionButtons(),
            verticalSpace(24),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.walletCoins.length,
                itemBuilder: (context, index) {
                  return WalletCoinTile(coin: state.walletCoins[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
