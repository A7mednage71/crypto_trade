import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFailureState extends StatelessWidget {
  const TextFailureState({super.key, required this.text, this.onRetry});
  final String text;
  final void Function()? onRetry;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppStyle.font16_400Weight.copyWith(color: AppColors.error),
          ),
          horizontalSpace(10),
          Visibility(
            visible: onRetry != null,
            child: IconButton(
              onPressed: onRetry,
              icon: Icon(Icons.refresh, color: AppColors.primary, size: 25.r),
            ),
          ),
        ],
      ),
    );
  }
}
