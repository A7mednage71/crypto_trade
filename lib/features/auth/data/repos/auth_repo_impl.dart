import 'package:crypto_trade/core/networking/api_error_handler.dart';
import 'package:crypto_trade/core/networking/api_result.dart';
import 'package:crypto_trade/features/auth/data/models/login_model.dart';
import 'package:crypto_trade/features/auth/data/models/otp_models.dart';
import 'package:crypto_trade/features/auth/data/models/register_model.dart';
import 'package:crypto_trade/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<ApiResult<UserCredential>> signInWithEmail(LoginModel model) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      return ApiResult.success(credential);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(ServerFailure.fromFirebaseError(e));
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<UserCredential>> signUpWithEmail(RegisterModel model) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      return ApiResult.success(credential);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(ServerFailure.fromFirebaseError(e));
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> sendOtp({
    required SendOtpModel model,
    required void Function(String verificationId) onCodeSent,
    required void Function(String error) onError,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: model.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        onError(ServerFailure.fromFirebaseError(e).errMessages);
      },
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Future<ApiResult<UserCredential>> verifyOtp(VerifyOtpModel model) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: model.verificationId,
        smsCode: model.smsCode,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      return ApiResult.success(userCredential);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(ServerFailure.fromFirebaseError(e));
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
