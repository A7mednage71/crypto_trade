import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:crypto_trade/core/utils/widgets/app_status_dialog.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_state.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthanticateWithGoogle extends StatelessWidget {
  const AuthanticateWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.googleSignInStatus != current.googleSignInStatus,
      listener: (context, state) {
        if (state.googleSignInStatus == GoogleSignInStatus.success) {
          context.pushNamed(Routes.mainLayoutScreen);
        } else if (state.googleSignInStatus == GoogleSignInStatus.error) {
          AppStatusDialog.show(
            context,
            isSuccess: false,
            message: state.error!,
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.googleSignInStatus != current.googleSignInStatus,
      builder: (context, state) {
        final isLoading =
            state.googleSignInStatus == GoogleSignInStatus.loading;
        return AuthSocialButton(
          label: 'Google',
          svgAsset: Assets.imagesSvgGoogle,
          isLoading: isLoading,
          onTap: () {
            if (isLoading) return;
            context.read<AuthCubit>().authenticateWithGoogle();
          },
        );
      },
    );
  }
}
