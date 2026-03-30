import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomWarningDialog extends StatelessWidget {
  const CustomWarningDialog({
    super.key,
    required this.content,
    this.contentStyle,
    required this.onConfirmTitle,
    required this.onCancelTitle,
    required this.onConfirmTap,
    this.onConfirmWidth = 100,
  });
  final String content;
  final TextStyle? contentStyle;
  final String onConfirmTitle;
  final String onCancelTitle;
  final void Function() onConfirmTap;
  final double onConfirmWidth;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(30.r),
      backgroundColor: AppColors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/svgs/warning_circle.svg',
            width: 100.w,
            height: 100.h,
            colorFilter: const ColorFilter.mode(
              AppColors.secondary,
              BlendMode.srcIn,
            ),
          ),
          verticalSpace(20),
          Text(
            content,
            style:
                contentStyle ??
                AppStyle.font20_600Weight.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                height: 40.h,
                width: 80.w,
                text: onCancelTitle,
                background: AppColors.secondary,
                customTextStyle: AppStyle.font16_400Weight.copyWith(
                  color: AppColors.white,
                ),
                customBorderRadius: BorderRadius.all(Radius.circular(10.r)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              horizontalSpace(10),
              CustomTextButton(
                height: 40.h,
                width: onConfirmWidth.w,
                text: onConfirmTitle,
                background: AppColors.error,
                customTextStyle: AppStyle.font16_400Weight.copyWith(
                  color: AppColors.white,
                ),
                customBorderRadius: BorderRadius.all(Radius.circular(10.r)),
                onPressed: onConfirmTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
