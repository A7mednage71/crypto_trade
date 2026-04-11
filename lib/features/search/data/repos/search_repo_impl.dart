import 'package:crypto_trade/core/networking/api_error_handler.dart';
import 'package:crypto_trade/core/networking/api_result.dart';
import 'package:crypto_trade/core/networking/api_service.dart';
import 'package:crypto_trade/features/search/data/models/search_result_model.dart';
import 'package:crypto_trade/features/search/data/repos/search_repo.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService _apiService;

  SearchRepoImpl(this._apiService);

  @override
  Future<ApiResult<List<SearchResultModel>>> searchCoins(String query) async {
    try {
      final response = await _apiService.searchCoins(query);
      return ApiResult.success(response.coins);
    } on DioException catch (error) {
      return ApiResult.failure(ServerFailure.fromDioError(error));
    }
  }
}
