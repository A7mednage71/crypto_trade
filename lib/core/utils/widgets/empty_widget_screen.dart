import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidgetScreen extends StatelessWidget {
  const EmptyWidgetScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    this.titleStyle,
    this.descriptionStyle,
    this.sizeBox,
  });

  final String image;
  final String title;
  final TextStyle? titleStyle;
  final String description;
  final TextStyle? descriptionStyle;
  final double? sizeBox;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          SizedBox(height: sizeBox ?? 20.h),
          Text(
            title,
            style:
                titleStyle ??
                AppStyle.font18_600Weight.copyWith(color: Colors.black),
          ),
          SizedBox(height: 10.h),
          Text(
            description,
            textAlign: TextAlign.center,
            style:
                descriptionStyle ??
                AppStyle.font13_400Weight.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
