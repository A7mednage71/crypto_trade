import 'package:crypto_trade/core/helpers/secure_storage_helper.dart';
import 'package:crypto_trade/core/networking/api_error_handler.dart';
import 'package:crypto_trade/core/networking/api_result.dart';
import 'package:crypto_trade/features/auth/data/models/login_model.dart';
import 'package:crypto_trade/features/auth/data/models/otp_models.dart';
import 'package:crypto_trade/features/auth/data/models/register_model.dart';
import 'package:crypto_trade/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<ApiResult<UserCredential>> signInWithEmail(LoginModel model) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      if (credential.user != null) {
        await EncryptedStorage.saveUserId(credential.user!.uid);
      }
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
      if (userCredential.user != null) {
        await EncryptedStorage.saveUserId(userCredential.user!.uid);
      }
      return ApiResult.success(userCredential);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(ServerFailure.fromFirebaseError(e));
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<UserCredential>> authenticateWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return ApiResult.failure(ServerFailure("Sign in cancelled"));
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      if (userCredential.user != null) {
        await EncryptedStorage.saveUserId(userCredential.user!.uid);
      }
      return ApiResult.success(userCredential);
    } on FirebaseAuthException catch (e) {
      return ApiResult.failure(ServerFailure.fromFirebaseError(e));
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    await EncryptedStorage.clearAll();
  }
}
