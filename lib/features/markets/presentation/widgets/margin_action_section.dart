import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarginActionSection extends StatelessWidget {
  const MarginActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: Row(
        children: [
          Expanded(
            child: MarginActionButton(
              label: 'Buy / Long',
              color: AppColors.secondary,
              onPressed: () {
                // Action logic here
              },
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: MarginActionButton(
              label: 'Sell / Short',
              color: AppColors.error,
              onPressed: () {
                // Action logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      ),
      child: Text(label, style: AppStyle.font16_600Weight),
    );
  }
}
