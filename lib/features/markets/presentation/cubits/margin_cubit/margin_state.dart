import 'package:crypto_trade/core/utils/enums/margin_mode.dart';
import 'package:crypto_trade/core/utils/enums/risk_level.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'margin_state.freezed.dart';

enum TradeStatus { initial, loading, success, failure }

@freezed
class MarginState with _$MarginState {
  const factory MarginState({
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
    @Default(0.0) double actualOrderAmount,
    @Default(0.0) double totalOrderValueUSD,
    @Default(0.0) double availableBalance,
  }) = _MarginState;
}
