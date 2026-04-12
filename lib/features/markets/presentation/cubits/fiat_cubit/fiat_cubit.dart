import 'package:flutter_bloc/flutter_bloc.dart';

import 'fiat_state.dart';

class FiatCubit extends Cubit<FiatState> {
  FiatCubit() : super(const FiatState());

  void updateFiatAmount(double amount) {
    emit(state.copyWith(fiatDepositAmount: amount));
  }

  void selectPaymentMethod(int index) {
    emit(state.copyWith(selectedPaymentMethodIndex: index));
  }

  Future<void> depositFiat(double amount) async {
    if (amount <= 0) return;
    emit(state.copyWith(fiatStatus: FiatStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(fiatStatus: FiatStatus.success));
  }

  void reset() {
    emit(
      state.copyWith(fiatStatus: FiatStatus.initial, fiatDepositAmount: 0.0),
    );
  }
}
