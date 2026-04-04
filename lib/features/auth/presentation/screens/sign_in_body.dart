import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/helpers/my_validator.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:crypto_trade/core/utils/widgets/app_status_dialog.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_state.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/authanticate_with_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign in',
              style: AppStyle.font28_600Weight.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email',
                  style: AppStyle.font13_400Weight.copyWith(
                    color: AppColors.lightGrey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.pushNamed(
                      Routes.registerWithMobile,
                      arguments: true,
                    );
                  },
                  child: Text(
                    'Sign in with mobile',
                    style: AppStyle.font13_400Weight.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            CustomTextFormField(
              controller: _emailController,
              textInputType: TextInputType.emailAddress,
              hint: 'Please enter email',
              validator: MyValidators.emailValidator,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
            ),
            verticalSpace(20),
            CustomTextFormField(
              label: 'Password',
              controller: _passwordController,
              textInputType: TextInputType.visiblePassword,
              hint: 'Please enter password',
              validator: MyValidators.passwordValidator,
              isPassword: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
            ),
            verticalSpace(12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.pushNamed(Routes.forgetPasswordScreen),
                child: Text(
                  'Forget password?',
                  style: AppStyle.font13_400Weight.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            verticalSpace(12),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.loginStatus == LoginStatus.success) {
                  context.pushNamed(Routes.mainLayoutScreen);
                } else if (state.loginStatus == LoginStatus.error) {
                  AppStatusDialog.show(
                    context,
                    isSuccess: false,
                    message: state.error!,
                  );
                }
              },
              buildWhen: (previous, current) =>
                  previous.loginStatus != current.loginStatus,
              builder: (context, state) {
                final isLoading = state.loginStatus == LoginStatus.loading;
                return CustomTextButton(
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().signInWithEmail(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    }
                  },
                  text: 'Sign in',
                  isLoading: isLoading,
                  disable: isLoading,
                  background: AppColors.primary,
                  height: 54.h,
                  isUpperCase: false,
                  customTextStyle: AppStyle.font18_400Weight.copyWith(
                    color: AppColors.darkBackground,
                  ),
                  customBorderRadius: BorderRadius.circular(16.r),
                );
              },
            ),
            verticalSpace(20),
            Center(
              child: Text(
                'Or login with',
                style: AppStyle.font14_400Weight.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ),
            verticalSpace(20),
            Row(
              children: [
                AuthSocialButton(
                  label: 'Facebook',
                  svgAsset: Assets.imagesSvgFacebook,
                  onTap: () {},
                ),
                horizontalSpace(20),
                AuthanticateWithGoogle(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
