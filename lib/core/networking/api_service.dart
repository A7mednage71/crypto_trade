import 'package:crypto_trade/core/base_models/base_response_model.dart';
import 'package:crypto_trade/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.register)
  Future<BaseResponseModel> register(@Body() FormData registerRequest);
}
