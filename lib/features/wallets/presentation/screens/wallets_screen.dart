import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/wallets/data/models/wallet_coin_model.dart';
import 'package:crypto_trade/features/wallets/presentation/widgets/wallet_action_buttons.dart';
import 'package:crypto_trade/features/wallets/presentation/widgets/wallet_balance_header.dart';
import 'package:crypto_trade/features/wallets/presentation/widgets/wallet_coin_tile.dart';
import 'package:flutter/material.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(16),
          const WalletBalanceHeader(),
          const WalletActionButtons(),
          verticalSpace(24),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: dummyWalletCoins.length,
              itemBuilder: (context, index) {
                return WalletCoinTile(coin: dummyWalletCoins[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
