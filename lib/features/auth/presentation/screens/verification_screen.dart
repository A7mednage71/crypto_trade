import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/helpers/my_validator.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/core/utils/widgets/app_status_dialog.dart';
import 'package:crypto_trade/features/auth/data/models/verification_params.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/otp_cubit/otp_cubit.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/otp_cubit/otp_state.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/otp_input_fields.dart';
import 'package:crypto_trade/features/auth/presentation/widgets/resend_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationScreen extends StatefulWidget {
  final VerificationParams params;

  const VerificationScreen({super.key, required this.params});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController _otpController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: CustomAppBar(title: "Verification", centerTitle: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(40),
                Text("Enter your code", style: AppStyle.font32_500Weight),
                verticalSpace(12),
                RichText(
                  text: TextSpan(
                    style: AppStyle.font14_400Weight.copyWith(
                      color: AppColors.grey.withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(text: "Please type the code we sent to  "),
                      TextSpan(
                        text: widget.params.phoneNumber,
                        style: AppStyle.font14_700Weight.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(48),
                OtpInputFields(
                  controller: _otpController,
                  validator: MyValidators.requiredValidator,
                  onCompleted: (otp) {
                    if (_formKey.currentState!.validate()) {
                      context.read<OtpCubit>().verifyOtp(otp);
                    }
                  },
                ),
                verticalSpace(32),
                ResendOtp(phoneNumber: widget.params.phoneNumber),
                verticalSpace(40),
                BlocConsumer<OtpCubit, OtpState>(
                  listenWhen: (previous, current) =>
                      previous.verifStatus != current.verifStatus,
                  listener: (context, state) {
                    if (state.verifStatus == VerifOtpStatus.success) {
                      if (widget.params.isLogin) {
                        ShowToast.showSuccessToast("Login successfully");
                        context.pushNamedAndRemoveUntil(
                          Routes.mainLayoutScreen,
                          predicate: (route) => false,
                        );
                      } else {
                        ShowToast.showSuccessToast("Registered successfully");
                        context.pushNamed(Routes.successRegistrationScreen);
                      }
                    } else if (state.verifStatus == VerifOtpStatus.error) {
                      AppStatusDialog.show(
                        context,
                        isSuccess: false,
                        message: state.verifyError ?? "Verification failed",
                      );
                    }
                  },
                  builder: (context, state) {
                    final isLoading =
                        state.verifStatus == VerifOtpStatus.loading;
                    return CustomTextButton(
                      onPressed: () {
                        if (isLoading) return;
                        HapticFeedback.mediumImpact();
                        if (_formKey.currentState!.validate()) {
                          context.read<OtpCubit>().verifyOtp(
                            _otpController.text.trim(),
                          );
                        }
                      },
                      text: "Continue",
                      background: AppColors.primary,
                      height: 56.h,
                      isUpperCase: false,
                      isLoading: isLoading,
                      disable: isLoading,
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
