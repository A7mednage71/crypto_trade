import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthSocialButton extends StatelessWidget {
  final String label;
  final String svgAsset;
  final VoidCallback? onTap;
  final bool isLoading;

  const AuthSocialButton({
    super.key,
    required this.label,
    required this.svgAsset,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 52.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: isLoading
                ? Border.all(color: AppColors.grey.withValues(alpha: 0.3))
                : null,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 24.h,
                    width: 24.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 4.w,
                      color: AppColors.primary,
                    ),
                  )
                : Row(
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
      ),
    );
  }
}
