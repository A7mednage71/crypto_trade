import 'package:crypto_trade/features/auth/data/models/otp_models.dart';
import 'package:crypto_trade/features/auth/data/repos/auth_repo.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/otp_cubit/otp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCubit extends Cubit<OtpState> {
  final AuthRepository _authRepository;

  OtpCubit(this._authRepository) : super(const OtpState());

  Future<void> sendOtp(String phoneNumber) async {
    emit(state.copyWith(sendStatus: SendOtpStatus.loading));
    await _authRepository.sendOtp(
      model: SendOtpModel(phoneNumber: phoneNumber),
      onCodeSent: (verificationId) {
        emit(
          state.copyWith(
            sendStatus: SendOtpStatus.codeSent,
            verificationId: verificationId,
          ),
        );
      },
      onError: (error) {
        emit(state.copyWith(sendStatus: SendOtpStatus.error, sendError: error));
      },
    );
  }

  Future<void> verifyOtp(String smsCode) async {
    final verificationId = state.verificationId;
    if (verificationId == null) {
      emit(
        state.copyWith(
          verifStatus: VerifOtpStatus.error,
          verifyError: "OTP verification failed (Missing ID)",
        ),
      );
      return;
    }

    emit(state.copyWith(verifStatus: VerifOtpStatus.loading));

    final result = await _authRepository.verifyOtp(
      VerifyOtpModel(verificationId: verificationId, smsCode: smsCode),
    );
    result.when(
      success: (user) {
        emit(state.copyWith(verifStatus: VerifOtpStatus.success));
      },
      failure: (error) {
        emit(
          state.copyWith(
            verifStatus: VerifOtpStatus.error,
            verifyError: error.errMessages,
          ),
        );
      },
    );
  }

  void clearStatus() {
    emit(const OtpState());
  }
}
