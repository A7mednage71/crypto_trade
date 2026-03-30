import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerTextButton extends StatelessWidget {
  const CustomContainerTextButton({
    super.key,
    required this.bkColor,
    required this.textColor,
    required this.title,
    this.onTap,
  });
  final Color bkColor;
  final Color textColor;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: 80.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: bkColor,
          border: Border.all(color: AppColors.white, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyle.font15_700Weight.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
