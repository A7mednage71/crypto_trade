import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/helpers/my_validator.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/core/utils/widgets/app_status_dialog.dart';
import 'package:crypto_trade/features/auth/data/models/verification_params.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/otp_cubit/otp_cubit.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/otp_cubit/otp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthWithMobileScreen extends StatefulWidget {
  final bool isLogin;

  const AuthWithMobileScreen({super.key, required this.isLogin});

  @override
  State<AuthWithMobileScreen> createState() => _AuthWithMobileScreenState();
}

class _AuthWithMobileScreenState extends State<AuthWithMobileScreen> {
  late TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otpCubit = context.read<OtpCubit>();
    return Scaffold(
      backgroundColor: AppColors.darkSurface,
      appBar: CustomAppBar(
        title: widget.isLogin ? "Sign In" : "Sign Up",
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(16),
                Text(
                  widget.isLogin
                      ? "Sign in with mobile"
                      : "Register with mobile",
                  style: AppStyle.font32_500Weight,
                ),
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
                  style: AppStyle.font14_400Weight.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                verticalSpace(12),
                CustomTextFormField(
                  controller: _phoneController,
                  hint: "Enter your mobile",
                  textInputType: TextInputType.phone,
                  validator: MyValidators.phoneNumberValidator,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                ),
                verticalSpace(60),
                BlocConsumer<OtpCubit, OtpState>(
                  listenWhen: (previous, current) =>
                      previous.sendStatus != current.sendStatus,
                  listener: (context, state) {
                    if (state.sendStatus == SendOtpStatus.codeSent) {
                      ShowToast.showSuccessToast("Code sent successfully");
                      context.pushNamed(
                        Routes.verificationScreen,
                        arguments: VerificationParams(
                          phoneNumber: '+20 ${_phoneController.text}',
                          isLogin: widget.isLogin,
                          otpCubit: otpCubit,
                        ),
                      );
                    } else if (state.sendStatus == SendOtpStatus.error) {
                      AppStatusDialog.show(
                        context,
                        isSuccess: false,
                        message: state.sendError ?? "Unknown error",
                      );
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state.sendStatus == SendOtpStatus.loading;
                    return CustomTextButton(
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        if (_formKey.currentState!.validate()) {
                          context.read<OtpCubit>().sendOtp(
                            '+20${_phoneController.text}',
                          );
                        }
                      },
                      disable: isLoading,
                      isLoading: isLoading,
                      text: "Send OTP",
                      background: AppColors.primary,
                      height: 56.h,
                      isUpperCase: false,
                      customTextStyle: AppStyle.font18_400Weight.copyWith(
                        color: AppColors.darkBackground,
                      ),
                      customBorderRadius: BorderRadius.circular(16.r),
                    );
                  },
                ),
                verticalSpace(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
