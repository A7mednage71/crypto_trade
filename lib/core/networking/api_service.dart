import 'package:crypto_trade/core/networking/api_constants.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:crypto_trade/features/coin_details/data/models/market_chart_response_model.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/search/data/models/search_result_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.coinsMarkets)
  Future<List<CoinResponseModel>> getMarketsData(
    @Queries() Map<String, dynamic> queries,
  );

  @GET("${ApiConstants.coinDetails}{id}")
  Future<CoinDetailResponseModel> getCoinDetails(@Path("id") String id);

  @GET(ApiConstants.marketChart)
  Future<MarketChartResponseModel> getCoinMarketChart(
    @Path("id") String id,
    @Queries() Map<String, dynamic> queries,
  );

  @GET(ApiConstants.searchCoins)
  Future<SearchResponseModel> searchCoins(@Query('query') String query);
}
