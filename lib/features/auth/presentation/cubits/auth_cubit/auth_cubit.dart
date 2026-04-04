import 'package:crypto_trade/features/auth/data/models/login_model.dart';
import 'package:crypto_trade/features/auth/data/models/register_model.dart';
import 'package:crypto_trade/features/auth/data/repos/auth_repo.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthState());

  Future<void> signInWithEmail(String email, String password) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    final result = await _authRepository.signInWithEmail(
      LoginModel(email: email, password: password),
    );

    result.when(
      success: (user) {
        emit(state.copyWith(loginStatus: LoginStatus.success));
      },
      failure: (error) {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.error,
            error: error.errMessages,
          ),
        );
      },
    );
  }

  Future<void> signUpWithEmail(String email, String password) async {
    emit(state.copyWith(registerStatus: RegisterStatus.loading));
    final result = await _authRepository.signUpWithEmail(
      RegisterModel(email: email, password: password),
    );
    result.when(
      success: (user) {
        emit(state.copyWith(registerStatus: RegisterStatus.success));
      },
      failure: (error) {
        emit(
          state.copyWith(
            registerStatus: RegisterStatus.error,
            error: error.errMessages,
          ),
        );
      },
    );
  }

  Future<void> authenticateWithGoogle() async {
    emit(state.copyWith(googleSignInStatus: GoogleSignInStatus.loading));
    final result = await _authRepository.authenticateWithGoogle();
    result.when(
      success: (user) {
        emit(state.copyWith(googleSignInStatus: GoogleSignInStatus.success));
      },
      failure: (error) {
        emit(
          state.copyWith(
            googleSignInStatus: GoogleSignInStatus.error,
            error: error.errMessages,
          ),
        );
      },
    );
  }

  void clearAuthStatus() {
    emit(
      state.copyWith(
        loginStatus: LoginStatus.initial,
        registerStatus: RegisterStatus.initial,
        error: null,
      ),
    );
  }
}
