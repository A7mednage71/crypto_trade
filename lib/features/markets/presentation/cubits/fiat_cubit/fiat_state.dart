import 'package:freezed_annotation/freezed_annotation.dart';

part 'fiat_state.freezed.dart';

enum FiatStatus { initial, loading, success, failure }

@freezed
class FiatState with _$FiatState {
  const factory FiatState({
    @Default(FiatStatus.initial) FiatStatus fiatStatus,
    @Default(0.0) double fiatDepositAmount,
    @Default(0) int selectedPaymentMethodIndex,
    String? message,
  }) = _FiatState;
}
