import 'package:crypto_trade/features/wallets/data/models/wallet_coin_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState(walletCoins: dummyWalletCoins));

  // used in fiat deposit
  void depositFiat(double amount) {
    if (amount <= 0) return;
    emit(state.copyWith(myBalance: state.myBalance + amount));
  }

  // used in convert and margin
  void deductBalance(double amount) {
    if (amount <= 0) return;
    final newBalance = state.myBalance - amount;
    emit(state.copyWith(myBalance: newBalance < 0 ? 0 : newBalance));
  }
}
