import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              label: 'SELL',
              color: AppColors.errorRed,
              onPressed: () {},
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: _buildActionButton(
              label: 'BUY',
              color: AppColors.primaryGreen,
              textColor: AppColors.black,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
    Color textColor = Colors.white,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Text(
        label,
        style: AppStyle.font16_600Weight.copyWith(
          color: textColor,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
