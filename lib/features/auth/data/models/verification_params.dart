import 'package:crypto_trade/features/auth/presentation/cubits/otp_cubit/otp_cubit.dart';

class VerificationParams {
  final String phoneNumber;
  final bool isLogin;
  final OtpCubit otpCubit;

  VerificationParams({
    required this.phoneNumber,
    required this.isLogin,
    required this.otpCubit,
  });
}
