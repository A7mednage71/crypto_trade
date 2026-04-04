import 'package:crypto_trade/core/networking/api_result.dart';
import 'package:crypto_trade/features/auth/data/models/login_model.dart';
import 'package:crypto_trade/features/auth/data/models/otp_models.dart';
import 'package:crypto_trade/features/auth/data/models/register_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<ApiResult<UserCredential>> signInWithEmail(LoginModel model);
  Future<ApiResult<UserCredential>> signUpWithEmail(RegisterModel model);
  Future<void> sendOtp({
    required SendOtpModel model,
    required void Function(String verificationId) onCodeSent,
    required void Function(String error) onError,
  });
  Future<ApiResult<UserCredential>> verifyOtp(VerifyOtpModel model);
  Future<void> signOut();
}
