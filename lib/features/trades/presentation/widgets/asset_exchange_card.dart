import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/core/utils/widgets/custom_cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetExchangeCard extends StatelessWidget {
  const AssetExchangeCard({
    super.key,
    required this.label,
    required this.currency,
    required this.iconUrl,
    required this.controller,
    this.balance,
    this.onCurrencyTap,
    this.borderColor,
  });

  final String label;
  final String currency;
  final String iconUrl;
  final TextEditingController controller;
  final String? balance;
  final VoidCallback? onCurrencyTap;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.lightGrey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20.r),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppStyle.font14_400Weight.copyWith(
                  color: AppColors.grey,
                ),
              ),
              if (balance != null)
                Text(
                  'Balance: $balance',
                  style: AppStyle.font14_400Weight.copyWith(
                    color: AppColors.grey,
                  ),
                ),
            ],
          ),
          verticalSpace(12),
          Row(
            children: [
              InkWell(
                onTap: onCurrencyTap,
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: iconUrl != '',
                        child: CustomNetworkImage(
                          imageUrl: iconUrl,
                          height: 24.h,
                          width: 24.w,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      horizontalSpace(8),
                      Text(
                        currency,
                        style: AppStyle.font16_600Weight.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.white,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.right,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  style: AppStyle.font24_600Weight.copyWith(
                    color: AppColors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    hintText: '0.00',
                    hintStyle: AppStyle.font24_600Weight.copyWith(
                      color: AppColors.grey.withValues(alpha: 0.3),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
