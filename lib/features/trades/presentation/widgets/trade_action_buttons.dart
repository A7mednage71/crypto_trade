import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeActionButtons extends StatelessWidget {
  const TradeActionButtons({super.key, this.onBuyTap, this.onSellTap});

  final VoidCallback? onBuyTap;
  final VoidCallback? onSellTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onBuyTap,
            child: Container(
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),
              child: Text(
                'Buy',
                style: AppStyle.font16_600Weight.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
        Container(width: 1.w, color: AppColors.darkBackground),
        Expanded(
          child: GestureDetector(
            onTap: onSellTap,
            child: Container(
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
              ),
              child: Text(
                'Sell',
                style: AppStyle.font16_600Weight.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
