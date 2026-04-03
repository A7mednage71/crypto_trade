part of 'markets_cubit.dart';

enum MarketsStatus { initial, loading, success, failure }

enum TradeStatus { initial, loading, success, failure }

@freezed
class MarketsState with _$MarketsState {
  const factory MarketsState({
    @Default(MarketsStatus.initial) MarketsStatus status,
    @Default([]) List<CoinResponseModel> coins,
    @Default(1) int currentPage,
    @Default(false) bool isLoadingMore,
    String? errorMessage,

    // convert fields
    CoinResponseModel? fromCoin,
    CoinResponseModel? toCoin,
    @Default(0.0) double fromAmount,
    @Default(0.0) double toAmount,
    @Default(0.0) double rate,

    // margin fields and trade status
    @Default(TradeStatus.initial) TradeStatus tradeStatus,
    String? tradeErrorMessage,
    @Default(1.0) double leverage,
    CoinResponseModel? selectedMarginCoin,
    @Default(MarginMode.cross) MarginMode marginMode,
    @Default(0.0) double amountToTrade,
    @Default(0.0) double maxBuy,
    @Default(0.0) double liquidationPrice,
    @Default(0.0) double riskPercentage,
    @Default(RiskLevel.low) RiskLevel riskLevel,
    @Default(1234.56) double availableBalance,
    @Default(0.0) double actualOrderAmount,
    @Default(0.0) double totalOrderValueUSD,
  }) = _MarketsState;
}
