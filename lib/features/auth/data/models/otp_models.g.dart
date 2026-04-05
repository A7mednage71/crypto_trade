// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpModel _$SendOtpModelFromJson(Map<String, dynamic> json) =>
    SendOtpModel(phoneNumber: json['phoneNumber'] as String);

Map<String, dynamic> _$SendOtpModelToJson(SendOtpModel instance) =>
    <String, dynamic>{'phoneNumber': instance.phoneNumber};

VerifyOtpModel _$VerifyOtpModelFromJson(Map<String, dynamic> json) =>
    VerifyOtpModel(
      verificationId: json['verificationId'] as String,
      smsCode: json['smsCode'] as String,
    );

Map<String, dynamic> _$VerifyOtpModelToJson(VerifyOtpModel instance) =>
    <String, dynamic>{
      'verificationId': instance.verificationId,
      'smsCode': instance.smsCode,
    };
