import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_chart_response_model.g.dart';

@JsonSerializable()
class MarketChartResponseModel {
  @JsonKey(name: 'prices')
  final List<List<double>> prices;

  MarketChartResponseModel({required this.prices});

  factory MarketChartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MarketChartResponseModelFromJson(json);
}
