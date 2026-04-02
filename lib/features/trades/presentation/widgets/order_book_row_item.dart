import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/trades/data/models/order_book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBookRowItem extends StatelessWidget {
  const OrderBookRowItem({
    super.key,
    required this.data,
    required this.maxVol,
    required this.isBid,
  });

  final OrderBookModel data;
  final double maxVol;
  final bool isBid;

  @override
  Widget build(BuildContext context) {
    final double barWidthFactor = maxVol > 0
        ? (data.volume / maxVol).clamp(0, 1)
        : 0;
    return SizedBox(
      height: 24.h,
      child: Stack(
        children: [
          Align(
            alignment: isBid ? Alignment.centerRight : Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: barWidthFactor,
              child: Container(
                color: isBid
                    ? AppColors.primary.withValues(alpha: 0.15)
                    : AppColors.error.withValues(alpha: 0.15),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.price.toStringAsFixed(2),
                  style: AppStyle.font12_400Weight.copyWith(
                    color: AppColors.darkSurface,
                  ),
                ),
                Text(
                  data.quantity.toStringAsFixed(2),
                  style: AppStyle.font12_400Weight.copyWith(
                    color: isBid ? AppColors.primary : AppColors.error,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
