import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/core/utils/enums/fiat_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiatPaymentMethodItem extends StatelessWidget {
  final FiatPaymentMethod method;
  final bool isSelected;
  final VoidCallback onTap;

  const FiatPaymentMethodItem({
    super.key,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: 120.w,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.darkSurface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5.w,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              method.icon,
              color: isSelected ? AppColors.primary : AppColors.grey,
              size: 28.r,
            ),
            SizedBox(height: 8.h),
            Text(
              method.name,
              style: AppStyle.font12_600Weight.copyWith(
                color: isSelected ? AppColors.white : AppColors.grey,
                fontSize: 11.sp,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
