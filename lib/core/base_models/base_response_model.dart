import 'package:crypto_trade/core/base_models/pagination_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseModel<T> {
  final int? status;
  final bool? success;
  final String? message;
  final T? data;
  @JsonKey(name: 'meta')
  final PaginationModel? pagination;

  BaseResponseModel({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseModelFromJson(json, fromJsonT);
}
