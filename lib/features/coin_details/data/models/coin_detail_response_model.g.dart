// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDetailResponseModel _$CoinDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    CoinDetailResponseModel(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: CoinImageModel.fromJson(json['image'] as Map<String, dynamic>),
      description: CoinDescriptionModel.fromJson(
          json['description'] as Map<String, dynamic>),
      marketData:
          MarketDataModel.fromJson(json['market_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinDetailResponseModelToJson(
        CoinDetailResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'market_data': instance.marketData,
    };

CoinImageModel _$CoinImageModelFromJson(Map<String, dynamic> json) =>
    CoinImageModel(
      thumb: json['thumb'] as String,
      small: json['small'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$CoinImageModelToJson(CoinImageModel instance) =>
    <String, dynamic>{
      'thumb': instance.thumb,
      'small': instance.small,
      'large': instance.large,
    };

CoinDescriptionModel _$CoinDescriptionModelFromJson(
        Map<String, dynamic> json) =>
    CoinDescriptionModel(
      en: json['en'] as String,
    );

Map<String, dynamic> _$CoinDescriptionModelToJson(
        CoinDescriptionModel instance) =>
    <String, dynamic>{
      'en': instance.en,
    };

MarketDataModel _$MarketDataModelFromJson(Map<String, dynamic> json) =>
    MarketDataModel(
      currentPrice: (json['current_price'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      marketCap: (json['market_cap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      totalVolume: (json['total_volume'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      circulatingSupply: (json['circulating_supply'] as num?)?.toDouble(),
      ath: (json['ath'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      priceChangePercentage24h:
          (json['price_change_percentage_24h'] as num).toDouble(),
      high24h: (json['high_24h'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      low24h: (json['low_24h'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$MarketDataModelToJson(MarketDataModel instance) =>
    <String, dynamic>{
      'current_price': instance.currentPrice,
      'market_cap': instance.marketCap,
      'total_volume': instance.totalVolume,
      'circulating_supply': instance.circulatingSupply,
      'ath': instance.ath,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
    };
