import 'package:json_annotation/json_annotation.dart';

part 'search_result_model.g.dart';

@JsonSerializable()
class SearchResultModel {
  final String id;
  final String name;
  final String symbol;

  @JsonKey(name: 'thumb')
  final String thumbImageUrl;
  @JsonKey(name: 'large')
  final String largeImageUrl;

  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;

  const SearchResultModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.thumbImageUrl,
    required this.largeImageUrl,
    this.marketCapRank,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultModelToJson(this);
}

@JsonSerializable()
class SearchResponseModel {
  final List<SearchResultModel> coins;

  const SearchResponseModel({required this.coins});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);
}
