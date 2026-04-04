import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

enum SendOtpStatus { initial, loading, codeSent, error }

enum VerifOtpStatus { initial, loading, success, error }

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    @Default(SendOtpStatus.initial) SendOtpStatus sendStatus,
    @Default(VerifOtpStatus.initial) VerifOtpStatus verifStatus,
    String? verificationId,
    String? sendError,
    String? verifyError,
  }) = _OtpState;
}
