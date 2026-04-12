import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'convert_state.freezed.dart';

enum ConvertStatus { initial, loading, success, failure }

@freezed
class ConvertState with _$ConvertState {
  const factory ConvertState({
    @Default(ConvertStatus.initial) ConvertStatus convertStatus,
    CoinResponseModel? fromCoin,
    CoinResponseModel? toCoin,
    @Default(0.0) double fromAmount,
    @Default(0.0) double toAmount,
    @Default(0.0) double rate,
    String? message,
  }) = _ConvertState;
}
