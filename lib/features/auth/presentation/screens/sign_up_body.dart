import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/auth_social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
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
                _isMobileMode ? 'Mobile Number' : 'Email',
                style: AppStyle.font13_400Weight.copyWith(
                  color: AppColors.lightGrey,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _isMobileMode = !_isMobileMode),
                child: Text(
                  _isMobileMode
                      ? 'Register with email'
                      : 'Register with mobile',
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
            hint: _isMobileMode ? 'Enter your mobile' : 'Please enter email',
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
            isPassword: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
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
                'Sign up',
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
          verticalSpace(20),
        ],
      ),
    );
  }
}
