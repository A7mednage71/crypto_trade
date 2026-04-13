import 'package:crypto_trade/features/wallets/data/models/wallet_coin_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(10000.0) double myBalance,
    @Default([]) List<WalletCoinModel> walletCoins,
  }) = _WalletState;
}
