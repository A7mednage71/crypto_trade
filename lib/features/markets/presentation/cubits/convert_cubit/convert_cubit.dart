import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'convert_state.dart';

class ConvertCubit extends Cubit<ConvertState> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  bool _isSyncing = false;

  ConvertCubit() : super(const ConvertState()) {
    fromController.addListener(_onFromAmountChanged);
    toController.addListener(_onToAmountChanged);
  }

  void _onFromAmountChanged() {
    if (_isSyncing) return;
    final amount = double.tryParse(fromController.text) ?? 0.0;
    if (amount != state.fromAmount) {
      updateConvertAmounts(isFromUpdate: true, amount: amount);
    }
  }

  void _onToAmountChanged() {
    if (_isSyncing) return;
    final amount = double.tryParse(toController.text) ?? 0.0;
    if (amount != state.toAmount) {
      updateConvertAmounts(isFromUpdate: false, amount: amount);
    }
  }

  void _syncControllers() {
    _isSyncing = true;
    final fromText = state.fromAmount == 0
        ? ""
        : state.fromAmount.toStringAsFixed(4);
    final toText = state.toAmount == 0 ? "" : state.toAmount.toStringAsFixed(4);

    if (fromController.text != fromText) {
      fromController.text = fromText;
    }
    if (toController.text != toText) {
      toController.text = toText;
    }
    _isSyncing = false;
  }

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
    _syncControllers();
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
    _syncControllers();
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
    _syncControllers();
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

  @override
  Future<void> close() {
    fromController.dispose();
    toController.dispose();
    return super.close();
  }
}
