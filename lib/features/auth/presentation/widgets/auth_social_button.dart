import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthSocialButton extends StatelessWidget {
  final String label;
  final String svgAsset;
  final VoidCallback? onTap;

  const AuthSocialButton({
    super.key,
    required this.label,
    required this.svgAsset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 52.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(svgAsset, height: 24.h, width: 24.h),
              horizontalSpace(8),
              Text(
                label,
                style: AppStyle.font18_400Weight.copyWith(
                  color: AppColors.darkBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
