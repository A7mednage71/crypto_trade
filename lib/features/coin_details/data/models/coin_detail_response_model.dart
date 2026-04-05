import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_detail_response_model.g.dart';

@JsonSerializable()
class CoinDetailResponseModel {
  final String id;
  final String symbol;
  final String name;
  final CoinImageModel image;
  final CoinDescriptionModel description;
  @JsonKey(name: 'market_data')
  final MarketDataModel marketData;

  CoinDetailResponseModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.description,
    required this.marketData,
  });

  factory CoinDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailResponseModelFromJson(json);
}

@JsonSerializable()
class CoinImageModel {
  final String thumb;
  final String small;
  final String large;

  CoinImageModel({
    required this.thumb,
    required this.small,
    required this.large,
  });

  factory CoinImageModel.fromJson(Map<String, dynamic> json) =>
      _$CoinImageModelFromJson(json);
}

@JsonSerializable()
class CoinDescriptionModel {
  final String en;

  CoinDescriptionModel({required this.en});

  factory CoinDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDescriptionModelFromJson(json);
}

@JsonSerializable()
class MarketDataModel {
  @JsonKey(name: 'current_price')
  final Map<String, double> currentPrice;

  @JsonKey(name: 'market_cap')
  final Map<String, double> marketCap;

  @JsonKey(name: 'total_volume')
  final Map<String, double> totalVolume;

  @JsonKey(name: 'circulating_supply')
  final double? circulatingSupply;

  @JsonKey(name: 'ath')
  final Map<String, double> ath;

  @JsonKey(name: 'price_change_percentage_24h')
  final double priceChangePercentage24h;

  @JsonKey(name: 'high_24h')
  final Map<String, double> high24h;

  @JsonKey(name: 'low_24h')
  final Map<String, double> low24h;

  MarketDataModel({
    required this.currentPrice,
    required this.marketCap,
    required this.totalVolume,
    this.circulatingSupply,
    required this.ath,
    required this.priceChangePercentage24h,
    required this.high24h,
    required this.low24h,
  });

  factory MarketDataModel.fromJson(Map<String, dynamic> json) =>
      _$MarketDataModelFromJson(json);
}
