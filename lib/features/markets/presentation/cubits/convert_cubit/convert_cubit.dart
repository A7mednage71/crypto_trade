import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'convert_state.dart';

class ConvertCubit extends Cubit<ConvertState> {
  ConvertCubit() : super(const ConvertState());

  void selectConvertCoin({
    required bool isFrom,
    required CoinResponseModel coin,
  }) {
    final newFromCoin = isFrom ? coin : state.fromCoin;
    final newToCoin = isFrom ? state.toCoin : coin;

    double newRate = 0.0;
    if (newFromCoin != null &&
        newToCoin != null &&
        newToCoin.currentPrice != 0) {
      newRate = newFromCoin.currentPrice / newToCoin.currentPrice;
    }

    final newToAmount = state.fromAmount * newRate;

    emit(
      state.copyWith(
        fromCoin: newFromCoin,
        toCoin: newToCoin,
        rate: newRate,
        toAmount: newToAmount,
      ),
    );
  }

  void updateConvertAmounts({
    required bool isFromUpdate,
    required double amount,
  }) {
    if (state.rate <= 0) return;

    if (isFromUpdate) {
      emit(state.copyWith(fromAmount: amount, toAmount: amount * state.rate));
    } else {
      emit(state.copyWith(toAmount: amount, fromAmount: amount / state.rate));
    }
  }

  void swapConvertCurrencies() {
    if (state.fromCoin == null || state.toCoin == null) return;

    final newFromCoin = state.toCoin;
    final newToCoin = state.fromCoin;

    double newRate = 0.0;
    if (newToCoin!.currentPrice != 0) {
      newRate = newFromCoin!.currentPrice / newToCoin.currentPrice;
    }

    emit(
      state.copyWith(
        fromCoin: newFromCoin,
        toCoin: newToCoin,
        rate: newRate,
        toAmount: state.fromAmount * newRate,
      ),
    );
  }

  Future<void> executeConvert() async {
    if (!canConvert) return;

    emit(state.copyWith(convertStatus: ConvertStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    final msg =
        "You successfully converted ${state.fromAmount} ${state.fromCoin?.symbol.toUpperCase()} to ${state.toAmount} ${state.toCoin?.symbol.toUpperCase()}";

    emit(state.copyWith(convertStatus: ConvertStatus.success, message: msg));
  }

  void resetConvertStatus() {
    emit(state.copyWith(convertStatus: ConvertStatus.initial));
  }

  bool get canConvert =>
      state.fromCoin != null && state.toCoin != null && state.fromAmount > 0;
}
