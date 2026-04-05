import 'package:crypto_trade/core/networking/api_error_handler.dart';
import 'package:crypto_trade/core/networking/api_result.dart';
import 'package:crypto_trade/core/networking/api_service.dart';
import 'package:crypto_trade/features/coin_details/data/models/chart_request_model.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:crypto_trade/features/coin_details/data/models/market_chart_response_model.dart';
import 'package:crypto_trade/features/coin_details/data/repos/coin_details_repo.dart';
import 'package:dio/dio.dart';

class CoinDetailsRepoImpl implements CoinDetailsRepo {
  final ApiService _apiService;

  CoinDetailsRepoImpl(this._apiService);

  @override
  Future<ApiResult<CoinDetailResponseModel>> getCoinDetails(String id) async {
    try {
      final response = await _apiService.getCoinDetails(id);
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ServerFailure.fromDioError(error));
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<MarketChartResponseModel>> getCoinMarketChart(
    String id,
    ChartRequestModel request,
  ) async {
    try {
      final response = await _apiService.getCoinMarketChart(
        id,
        request.toJson(),
      );
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ServerFailure.fromDioError(error));
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}
