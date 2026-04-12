part of 'markets_cubit.dart';

enum MarketsStatus { initial, loading, success, failure }

@freezed
class MarketsState with _$MarketsState {
  const factory MarketsState({
    @Default(MarketsStatus.initial) MarketsStatus status,
    @Default([]) List<CoinResponseModel> coins,
    @Default(1) int currentPage,
    @Default(false) bool isLoadingMore,
    String? errorMessage,
    @Default(1234.56) double availableBalance,
  }) = _MarketsState;
}
