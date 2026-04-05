import 'package:crypto_trade/core/networking/api_result.dart';
import 'package:crypto_trade/features/coin_details/data/models/chart_request_model.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:crypto_trade/features/coin_details/data/models/market_chart_response_model.dart';

abstract class CoinDetailsRepo {
  Future<ApiResult<CoinDetailResponseModel>> getCoinDetails(String id);
  Future<ApiResult<MarketChartResponseModel>> getCoinMarketChart(
    String id,
    ChartRequestModel request,
  );
}
