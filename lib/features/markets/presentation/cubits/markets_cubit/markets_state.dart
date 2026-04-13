part of 'markets_cubit.dart';

enum MarketsStatus { initial, loading, success, failure }

@freezed
class MarketsState with _$MarketsState {
  const factory MarketsState({
    @Default(MarketsStatus.initial) MarketsStatus status,
    @Default([]) List<CoinResponseModel> spotCoins,
    @Default([]) List<CoinResponseModel> convertCoins,
    @Default([]) List<CoinResponseModel> marginCoins,
    @Default([]) List<CoinResponseModel> fiatCoins,
    @Default(1) int currentPage,
    @Default(false) bool isLoadingMore,
    String? errorMessage,
  }) = _MarketsState;
}
