import 'package:crypto_trade/core/utils/enums/fiat_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fiat_state.dart';

class FiatCubit extends Cubit<FiatState> {
  final TextEditingController amountController = TextEditingController();
  bool _isSyncing = false;

  FiatCubit() : super(const FiatState()) {
    amountController.addListener(_onAmountTextChanged);
  }

  void _onAmountTextChanged() {
    if (_isSyncing) return;
    final amount = double.tryParse(amountController.text) ?? 0.0;
    if (amount != state.fiatDepositAmount) {
      emit(state.copyWith(fiatDepositAmount: amount));
    }
  }

  void updateFiatAmount(double amount) {
    if (amount == state.fiatDepositAmount) return;
    emit(state.copyWith(fiatDepositAmount: amount));
    _syncController();
  }

  void _syncController() {
    _isSyncing = true;
    final text = state.fiatDepositAmount == 0.0
        ? ''
        : state.fiatDepositAmount.toString();
    if (amountController.text != text) {
      amountController.text = text;
    }
    _isSyncing = false;
  }

  void selectPaymentMethod(FiatPaymentMethod method) {
    emit(state.copyWith(selectedPaymentMethod: method));
  }

  Future<void> depositFiat(double amount) async {
    if (amount <= 0) return;
    emit(state.copyWith(fiatStatus: FiatStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(fiatStatus: FiatStatus.success));
  }

  void reset() {
    amountController.clear();
    emit(
      state.copyWith(fiatStatus: FiatStatus.initial, fiatDepositAmount: 0.0),
    );
  }

  @override
  Future<void> close() {
    amountController.dispose();
    return super.close();
  }
}
