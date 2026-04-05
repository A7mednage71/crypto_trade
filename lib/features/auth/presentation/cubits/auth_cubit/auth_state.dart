import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum LoginStatus { initial, loading, success, error }

enum RegisterStatus { initial, loading, success, error }

enum GoogleSignInStatus { initial, loading, success, error }

enum SignOutStatus { initial, loading, success, error }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(LoginStatus.initial) LoginStatus loginStatus,
    @Default(RegisterStatus.initial) RegisterStatus registerStatus,
    @Default(GoogleSignInStatus.initial) GoogleSignInStatus googleSignInStatus,
    @Default(SignOutStatus.initial) SignOutStatus signOutStatus,
    String? error,
  }) = _AuthState;
}
