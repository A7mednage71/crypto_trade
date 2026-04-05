import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  final String email;
  final String password;

  RegisterModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
