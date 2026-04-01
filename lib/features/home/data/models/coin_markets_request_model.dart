import 'package:crypto_trade/core/utils/enums/coin_order_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_markets_request_model.g.dart';

@JsonSerializable(createFactory: false)
class CoinMarketsRequestModel {
  @JsonKey(name: 'vs_currency')
  final String vsCurrency;
  final CoinOrder order;
  @JsonKey(name: 'per_page')
  final int perPage;
  final int page;
  final bool sparkline;
  @JsonKey(name: 'price_change_percentage')
  final String priceChangePercentage;

  CoinMarketsRequestModel({
    this.vsCurrency = 'usd',
    this.order = CoinOrder.marketCapDesc,
    this.perPage = 10,
    this.page = 1,
    this.sparkline = true,
    this.priceChangePercentage = '24h',
  });

  Map<String, dynamic> toJson() => _$CoinMarketsRequestModelToJson(this);
}
