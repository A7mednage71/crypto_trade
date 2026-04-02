import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradingNumberInput extends StatelessWidget {
  const TradingNumberInput({
    super.key,
    required this.label,
    required this.controller,
    required this.onIncrement,
    required this.onDecrement,
    this.hintText,
    this.suffixText,
    this.isEnabled = true,
  });

  final String label;
  final TextEditingController controller;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final String? hintText;
  final String? suffixText;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1.0 : 0.5,
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: AppColors.lightGrey.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.lightGrey.withValues(alpha: 0.1),
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Text(
                label,
                style: AppStyle.font12_400Weight.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                enabled: isEnabled,
                textAlign: TextAlign.center,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                style: AppStyle.font14_400Weight.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: isEnabled ? hintText : "Market Price",
                  hintStyle: AppStyle.font14_400Weight.copyWith(
                    color: AppColors.grey.withValues(alpha: 0.5),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  suffixText: suffixText,
                  suffixStyle: AppStyle.font12_400Weight.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                _buildStepButton(Icons.add, onIncrement),
                Container(
                  width: 1.w,
                  height: 24.h,
                  color: AppColors.grey.withValues(alpha: 0.1),
                ),
                _buildStepButton(Icons.remove, onDecrement),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepButton(IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          width: 44.w,
          height: double.infinity,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: isEnabled ? AppColors.white : AppColors.grey,
            size: 18.sp,
          ),
        ),
      ),
    );
  }
}
