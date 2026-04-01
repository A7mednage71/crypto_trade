// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_markets_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CoinMarketsRequestModelToJson(
  CoinMarketsRequestModel instance,
) => <String, dynamic>{
  'vs_currency': instance.vsCurrency,
  'order': _$CoinOrderEnumMap[instance.order]!,
  'per_page': instance.perPage,
  'page': instance.page,
  'sparkline': instance.sparkline,
  'price_change_percentage': instance.priceChangePercentage,
};

const _$CoinOrderEnumMap = {
  CoinOrder.marketCapDesc: 'market_cap_desc',
  CoinOrder.marketCapAsc: 'market_cap_asc',
  CoinOrder.volumeDesc: 'volume_desc',
  CoinOrder.volumeAsc: 'volume_asc',
  CoinOrder.idDesc: 'id_desc',
  CoinOrder.idAsc: 'id_asc',
};
