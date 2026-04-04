import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/helpers/my_validator.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:crypto_trade/core/utils/widgets/app_status_dialog.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_state.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
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
              'Sign up',
              style: AppStyle.font28_600Weight.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            verticalSpace(40),
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
                  onPressed: () => context.pushNamed(
                    Routes.registerWithMobile,
                    arguments: false,
                  ),
                  child: Text(
                    'Register with mobile',
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
            verticalSpace(30),
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
            verticalSpace(40),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.registerStatus == RegisterStatus.success) {
                  context.pushNamed(Routes.successRegistrationScreen);
                } else if (state.registerStatus == RegisterStatus.error) {
                  AppStatusDialog.show(
                    context,
                    isSuccess: false,
                    message: state.error!,
                  );
                }
              },
              buildWhen: (previous, current) =>
                  previous.registerStatus != current.registerStatus,
              builder: (context, state) {
                final isLoading =
                    state.registerStatus == RegisterStatus.loading;
                return CustomTextButton(
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().signUpWithEmail(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    }
                  },
                  text: 'Sign up',
                  disable: isLoading,
                  isLoading: isLoading,
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
                AuthSocialButton(
                  label: 'Google',
                  svgAsset: Assets.imagesSvgGoogle,
                  onTap: () {},
                ),
              ],
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
