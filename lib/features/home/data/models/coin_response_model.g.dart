// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinResponseModel _$CoinResponseModelFromJson(Map<String, dynamic> json) =>
    CoinResponseModel(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      currentPrice: (json['current_price'] as num).toDouble(),
      priceChangePercentage24h: (json['price_change_percentage_24h'] as num)
          .toDouble(),
      marketCap: (json['market_cap'] as num?)?.toDouble(),
      marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
      priceChange24h: (json['price_change_24h'] as num?)?.toDouble(),
      high24h: (json['high_24h'] as num?)?.toDouble(),
      low24h: (json['low_24h'] as num?)?.toDouble(),
      ath: (json['ath'] as num?)?.toDouble(),
      atl: (json['atl'] as num?)?.toDouble(),
      lastUpdated: json['last_updated'] as String?,
      sparkline: json['sparkline_in_7d'] == null
          ? null
          : SparklineModel.fromJson(
              json['sparkline_in_7d'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CoinResponseModelToJson(CoinResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'market_cap': instance.marketCap,
      'market_cap_rank': instance.marketCapRank,
      'price_change_24h': instance.priceChange24h,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
      'ath': instance.ath,
      'atl': instance.atl,
      'last_updated': instance.lastUpdated,
      'sparkline_in_7d': instance.sparkline,
    };

SparklineModel _$SparklineModelFromJson(Map<String, dynamic> json) =>
    SparklineModel(
      prices: (json['price'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$SparklineModelToJson(SparklineModel instance) =>
    <String, dynamic>{'price': instance.prices};
