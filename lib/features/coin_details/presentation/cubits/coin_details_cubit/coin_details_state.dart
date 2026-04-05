import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:crypto_trade/features/coin_details/data/models/market_chart_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_details_state.freezed.dart';

enum CoinDetailsStatus { initial, loading, success, failure, chartLoading }

@freezed
class CoinDetailsState with _$CoinDetailsState {
  const factory CoinDetailsState({
    @Default(CoinDetailsStatus.initial) CoinDetailsStatus status,
    CoinDetailResponseModel? coinDetails,
    MarketChartResponseModel? chartData,
    String? errorMessage,
  }) = _CoinDetailsState;
}
