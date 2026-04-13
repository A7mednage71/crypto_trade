import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinPickerSheetItem extends StatelessWidget {
  const CoinPickerSheetItem({
    super.key,
    required this.coin,
    required this.onTap,
  });

  final CoinResponseModel coin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.lightGrey.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            CustomNetworkImage(
              imageUrl: coin.image,
              height: 36.h,
              width: 36.w,
              borderRadius: BorderRadius.circular(18.r),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.symbol.toUpperCase(),
                    style: AppStyle.font16_600Weight.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    coin.name,
                    style: AppStyle.font12_400Weight.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.grey,
              size: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
