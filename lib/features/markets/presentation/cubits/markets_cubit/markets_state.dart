part of 'markets_cubit.dart';

enum MarketsStatus { initial, loading, success, failure }

@freezed
class MarketsState with _$MarketsState {
  const factory MarketsState({
    @Default(MarketsStatus.initial) MarketsStatus status,
    @Default([]) List<CoinResponseModel> coins,
    String? errorMessage,
  }) = _MarketsState;
}
