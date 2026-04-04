import 'package:json_annotation/json_annotation.dart';

part 'otp_models.g.dart';

@JsonSerializable()
class SendOtpModel {
  final String phoneNumber;

  SendOtpModel({required this.phoneNumber});

  Map<String, dynamic> toJson() => _$SendOtpModelToJson(this);
}

@JsonSerializable()
class VerifyOtpModel {
  final String verificationId;
  final String smsCode;

  VerifyOtpModel({required this.verificationId, required this.smsCode});

  Map<String, dynamic> toJson() => _$VerifyOtpModelToJson(this);
}
