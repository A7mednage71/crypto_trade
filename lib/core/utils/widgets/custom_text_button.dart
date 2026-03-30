import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextButton extends StatelessWidget {
  final double width;
  final Color background;
  final bool isUpperCase;
  final double radius;
  final bool disable;
  final bool isBorder;
  final Color? borderColor;
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final double? height;
  final TextStyle? customTextStyle;
  final double fontSize;
  final BorderRadiusGeometry customBorderRadius;
  final double elevation;
  final bool? activeIconImage;
  final String? iconImage;
  final Color? iconColor;
  final double? iconSize;
  final bool isIconLeft;
  final Color? disableColor;
  const CustomTextButton({
    super.key,
    this.width = double.infinity,
    this.background = AppColors.primary,
    this.isBorder = false,
    this.borderColor,
    this.isUpperCase = true,
    this.radius = 4.0,
    required this.onPressed,
    required this.text,
    this.disable = false,
    this.isLoading = false,
    this.height = 42,
    this.customTextStyle,
    this.fontSize = 18.0,
    this.elevation = 1.0,
    this.customBorderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.activeIconImage = false,
    this.iconImage,
    this.iconColor,
    this.iconSize,
    this.isIconLeft = true,
    this.disableColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    final textButton = SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: disable ? null : onPressed,
        style: TextButton.styleFrom(
          elevation: elevation,
          backgroundColor: disable ? disableColor : background,
          shape: RoundedRectangleBorder(
            borderRadius: customBorderRadius,
            side: isBorder
                ? BorderSide(
                    color: borderColor ?? AppColors.lightGrey,
                    width: 1.w,
                  )
                : BorderSide.none,
          ),
        ),
        child: FittedBox(
          child: Row(
            children: [
              if (activeIconImage! && isIconLeft) ...[
                SvgPicture.asset(
                  iconImage!,
                  width: iconSize ?? 25.w,
                  height: iconSize ?? 25.h,
                  colorFilter: iconColor != null
                      ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                      : null,
                ),
                SizedBox(width: 10.w),
              ],
              Text(
                isUpperCase ? text.toUpperCase() : text,
                style:
                    customTextStyle ??
                    TextStyle(
                      color: disable ? AppColors.white : AppColors.primary,
                      fontSize: fontSize.sp,
                    ),
              ),
              if (activeIconImage! && isIconLeft == false) ...[
                SizedBox(width: 10.w),
                SvgPicture.asset(
                  iconImage!,
                  width: iconSize ?? 25.w,
                  height: iconSize ?? 25.h,
                  colorFilter: iconColor != null
                      ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                      : null,
                ),
              ],
            ],
          ),
        ),
      ),
    );

    final TextButtonLoading = SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: disable ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: disable ? disableColor : background,
          shape: RoundedRectangleBorder(
            borderRadius: customBorderRadius,
            side: isBorder
                ? BorderSide(
                    color: borderColor ?? AppColors.lightGrey,
                    width: 1.0,
                  )
                : BorderSide.none,
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );

    return isLoading
        ? SizedBox(height: height, child: TextButtonLoading)
        : SizedBox(width: width, height: height, child: textButton);
  }
}
