import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterWithMobile extends StatefulWidget {
  const RegisterWithMobile({super.key});

  @override
  State<RegisterWithMobile> createState() => _RegisterWithMobileState();
}

class _RegisterWithMobileState extends State<RegisterWithMobile> {
  late TextEditingController _phoneController;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _phoneController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      _isButtonEnabled = _phoneController.text.length >= 10;
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkSurface,
      appBar: CustomAppBar(title: "Sign Up", centerTitle: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            Text("Register with mobile", style: AppStyle.font32_500Weight),
            verticalSpace(12),
            Text(
              "Please type your number, then we’ll send a verification code for authentication.",
              style: AppStyle.font14_400Weight.copyWith(
                color: AppColors.grey.withValues(alpha: 0.8),
                height: 1.5,
              ),
            ),
            verticalSpace(48),
            Text(
              "Mobile Number",
              style: AppStyle.font14_400Weight.copyWith(color: AppColors.grey),
            ),
            verticalSpace(12),
            CustomTextFormField(
              controller: _phoneController,
              hint: "Enter your mobile",
              textInputType: TextInputType.phone,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
            ),
            verticalSpace(40),
            CustomTextButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                context.pushNamed(
                  Routes.verificationScreen,
                  arguments: '+20 ${_phoneController.text}',
                );
              },
              text: "Send OTP",
              disable: !_isButtonEnabled,
              disableColor: AppColors.primary.withValues(alpha: 0.3),
              background: AppColors.primary,
              height: 56.h,
              isUpperCase: false,
              customTextStyle: AppStyle.font18_400Weight.copyWith(
                color: AppColors.darkBackground,
              ),
              customBorderRadius: BorderRadius.circular(16.r),
            ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
