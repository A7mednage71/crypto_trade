import 'package:crypto_trade/core/networking/api_result.dart';
import 'package:crypto_trade/features/search/data/models/search_result_model.dart';

abstract class SearchRepo {
  Future<ApiResult<List<SearchResultModel>>> searchCoins(String query);
}
