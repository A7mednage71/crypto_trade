import 'package:crypto_trade/core/networking/api_constants.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
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
}
