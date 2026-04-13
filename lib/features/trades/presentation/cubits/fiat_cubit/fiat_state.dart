import 'package:crypto_trade/core/utils/enums/fiat_payment_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fiat_state.freezed.dart';

enum FiatStatus { initial, loading, success, failure }

@freezed
class FiatState with _$FiatState {
  const factory FiatState({
    @Default(FiatStatus.initial) FiatStatus fiatStatus,
    @Default(0.0) double fiatDepositAmount,
    @Default(FiatPaymentMethod.creditCard)
    FiatPaymentMethod selectedPaymentMethod,
    String? message,
  }) = _FiatState;
}
