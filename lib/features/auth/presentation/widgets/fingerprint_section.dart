import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FingerprintSection extends StatelessWidget {
  const FingerprintSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Icon(Icons.fingerprint, size: 50.sp, color: AppColors.primary),
          SizedBox(height: 10.h),
          Text(
            'Use fingerprint instead?',
            style: AppStyle.font14_400Weight.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
