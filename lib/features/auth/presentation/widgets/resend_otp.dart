import 'dart:async';

import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/otp_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendOtp extends StatefulWidget {
  final String phoneNumber;

  const ResendOtp({super.key, required this.phoneNumber});

  @override
  State<ResendOtp> createState() => _ResendOtpState();
}

class _ResendOtpState extends State<ResendOtp> {
  int _timerSeconds = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _timerSeconds = 30);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds == 0) {
        timer.cancel();
      } else {
        setState(() => _timerSeconds--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Resend code (${_timerSeconds.toString().padLeft(2, '0')})",
            style: AppStyle.font14_400Weight.copyWith(color: AppColors.grey),
          ),
          if (_timerSeconds == 0) ...[
            verticalSpace(12),
            TextButton(
              onPressed: () {
                _startTimer();
                context.read<OtpCubit>().sendOtp(widget.phoneNumber);
              },
              child: Text(
                "Resend Link",
                style: AppStyle.font14_700Weight.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
