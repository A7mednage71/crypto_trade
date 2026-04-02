import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBookHeader extends StatelessWidget {
  const OrderBookHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Bid',
              style: AppStyle.font12_400Weight.copyWith(color: AppColors.grey),
              textAlign: TextAlign.left,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Text(
              'Ask',
              style: AppStyle.font12_400Weight.copyWith(color: AppColors.grey),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
