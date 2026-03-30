import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/fingerprint_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isMobileMode = false;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign in',
            style: AppStyle.font28_600Weight.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalSpace(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _isMobileMode ? 'Mobile Number' : 'Email',
                style: AppStyle.font13_400Weight.copyWith(
                  color: AppColors.lightGrey,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _isMobileMode = !_isMobileMode),
                child: Text(
                  !_isMobileMode ? 'Sign in with mobile' : 'Sign in with email',
                  style: AppStyle.font13_400Weight.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(8),
          CustomTextFormField(
            controller: _isMobileMode ? _phoneController : _emailController,
            textInputType: _isMobileMode
                ? TextInputType.phone
                : TextInputType.emailAddress,
            hint: _isMobileMode ? 'Enter your mobile' : 'Enter your email',
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
            hint: 'Enter your password',
            isPassword: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
          ),
          verticalSpace(10),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            child: Text(
              'Forgot password?',
              style: AppStyle.font14_400Weight.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          verticalSpace(40),
          SizedBox(
            width: double.infinity,
            height: 54.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.darkBackground,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text(
                'Sign in',
                style: AppStyle.font18_400Weight.copyWith(
                  color: AppColors.darkBackground,
                ),
              ),
            ),
          ),
          verticalSpace(20),
          Center(
            child: Text(
              'Or login with',
              style: AppStyle.font14_400Weight.copyWith(color: AppColors.grey),
            ),
          ),
          verticalSpace(20),
          Row(
            children: [
              AuthSocialButton(
                label: 'Facebook',
                svgAsset: 'assets/images/svg/facebook.svg',
                onTap: () {},
              ),
              horizontalSpace(20),
              AuthSocialButton(
                label: 'Google',
                svgAsset: 'assets/images/svg/google.svg',
                onTap: () {},
              ),
            ],
          ),
          verticalSpace(50),
          Center(child: FingerprintSection()),
          verticalSpace(20),
        ],
      ),
    );
  }
}
