import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static TextStyle font36_700Weight = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle font32_600Weight = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle font32_400Weight = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle font30_800Weight = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle font28_600Weight = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle font24_700Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle font24_600Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle font24_500Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static TextStyle font24_400Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle font22_600Weight = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle font20_700Weight = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle font20_600Weight = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle font20_400Weight = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle font19_700Weight = TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle font17_700Weight = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle font18_600Weight = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle font18_500Weight = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static TextStyle font18_400Weight = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle font15_500Weight = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static TextStyle font15_700Weight = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle font15_400Weight = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle font16_700Weight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle font16_600Weight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle font16_400Weight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle font14_700Weight = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle font14_400Weight = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static TextStyle font13_400Weight = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle font12_600Weight = TextStyle(
    fontSize: 12.sp,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font12_400Weight = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle font11_400Weight = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle font10_400Weight = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static InputBorder borderDone({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.darkBackground),
      borderRadius: BorderRadius.circular(12.r),
    );
  }

  static InputBorder borderFocuse({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.darkBackground),
      borderRadius: BorderRadius.circular(12.r),
    );
  }

  static InputBorder borderError(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      borderRadius: BorderRadius.circular(12.r),
    );
  }

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondary,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
