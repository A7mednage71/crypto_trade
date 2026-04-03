import 'package:crypto_trade/core/networking/api_result.dart';
import 'package:crypto_trade/features/home/data/models/coin_markets_request_model.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';

abstract class MarketsRepo {
  Future<ApiResult<List<CoinResponseModel>>> getMarketsCoins(
    CoinMarketsRequestModel request,
  );
}
