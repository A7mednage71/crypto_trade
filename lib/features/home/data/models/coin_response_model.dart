import 'package:fl_chart/fl_chart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_response_model.g.dart';

@JsonSerializable()
class CoinResponseModel {
  final String id;
  final String symbol;
  final String name;
  final String image;

  @JsonKey(name: 'current_price')
  final double currentPrice;

  @JsonKey(name: 'market_cap')
  final double? marketCap;

  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;

  @JsonKey(name: 'price_change_24h')
  final double? priceChange24h;

  @JsonKey(name: 'price_change_percentage_24h')
  final double priceChangePercentage24h;

  @JsonKey(name: 'high_24h')
  final double? high24h;

  @JsonKey(name: 'low_24h')
  final double? low24h;

  final double? ath;
  final double? atl;

  @JsonKey(name: 'last_updated')
  final String? lastUpdated;

  @JsonKey(name: 'sparkline_in_7d')
  final SparklineModel? sparkline;

  CoinResponseModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage24h,
    this.marketCap,
    this.marketCapRank,
    this.priceChange24h,
    this.high24h,
    this.low24h,
    this.ath,
    this.atl,
    this.lastUpdated,
    this.sparkline,
  });

  factory CoinResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoinResponseModelFromJson(json);
}

@JsonSerializable()
class SparklineModel {
  @JsonKey(name: 'price')
  final List<double> prices;

  SparklineModel({required this.prices});

  factory SparklineModel.fromJson(Map<String, dynamic> json) =>
      _$SparklineModelFromJson(json);
}

extension CoinModelX on CoinResponseModel {
  bool get isPositive => priceChangePercentage24h >= 0;

  String get formattedPrice => '\$${currentPrice.toStringAsFixed(2)}';

  String get formattedChange =>
      '${isPositive ? '+' : ''}${priceChangePercentage24h.toStringAsFixed(2)}%';

  String get rankString => '#$marketCapRank';

  String get dayHigh => '\$${high24h?.toStringAsFixed(2) ?? '0.00'}';
  String get dayLow => '\$${low24h?.toStringAsFixed(2) ?? '0.00'}';

  List<FlSpot> get sparklineSpots {
    if (sparkline == null || sparkline!.prices.isEmpty) {
      return const [FlSpot(0, 0)];
    }
    return sparkline!.prices
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList();
  }
}
