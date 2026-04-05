import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_request_model.g.dart';

@JsonSerializable(createFactory: false)
class ChartRequestModel {
  @JsonKey(name: 'vs_currency')
  final String vsCurrency;
  final int days;

  ChartRequestModel({this.vsCurrency = 'usd', this.days = 1});

  Map<String, dynamic> toJson() => _$ChartRequestModelToJson(this);
}
