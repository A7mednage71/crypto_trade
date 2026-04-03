import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/core/utils/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarginActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const MarginActionButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text: label,
      background: color,
      onPressed: onPressed,
      height: 48.h,
      isUpperCase: false,
      customTextStyle: AppStyle.font16_600Weight,
      customBorderRadius: BorderRadius.circular(12.r),
    );
  }
}
