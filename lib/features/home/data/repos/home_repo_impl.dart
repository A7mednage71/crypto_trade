import 'package:crypto_trade/core/networking/api_error_handler.dart';
import 'package:crypto_trade/core/networking/api_result.dart';
import 'package:crypto_trade/core/networking/api_service.dart';
import 'package:crypto_trade/features/home/data/models/coin_markets_request_model.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

  @override
  Future<ApiResult<List<CoinResponseModel>>> getHomeCoins(
    CoinMarketsRequestModel request,
  ) async {
    try {
      final response = await _apiService.getMarketsData(request.toJson());
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ServerFailure.fromDioError(error));
    }
  }
}
