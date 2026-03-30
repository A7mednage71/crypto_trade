import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FailureState extends StatelessWidget {
  const FailureState({
    super.key,
    required this.size,
    this.message,
    this.messageStyle,
    this.onPressed,
    this.buttonStyle,
    this.withContainer = false,
    this.mainAxisAlignment,
  });

  final double size;
  final String? message;
  final TextStyle? messageStyle;
  final void Function()? onPressed;
  final TextStyle? buttonStyle;
  final bool withContainer;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/animations/failure_state.json',
          height: size.h,
          width: size.w,
        ),
        horizontalSpace(10),
        Text(
          message ?? "Something went wrong",
          style: messageStyle ?? AppStyle.font16_600Weight,
          textAlign: TextAlign.start,
        ),
        if (onPressed != null)
          Align(
            alignment: context.isArabic
                ? Alignment.bottomLeft
                : Alignment.bottomRight,
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                "Try Again",
                style:
                    buttonStyle ??
                    AppStyle.font16_600Weight.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ),
          ),
      ],
    );

    return withContainer
        ? Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.sp)),
              border: Border.all(color: AppColors.lightGrey, width: 1),
            ),
            child: content,
          )
        : content;
  }
}
