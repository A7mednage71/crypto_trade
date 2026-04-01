import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletActionButtons extends StatelessWidget {
  const WalletActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: CustomTextButton(
              text: 'Deposit',
              background: AppColors.primary,
              isUpperCase: false,
              elevation: 0,
              height: 44.h,
              customBorderRadius: BorderRadius.circular(12.r),
              customTextStyle: AppStyle.font14_400Weight.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
              onPressed: () {},
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: CustomTextButton(
              text: 'Withdraw',
              background: AppColors.darkSurface,
              isUpperCase: false,
              elevation: 0,
              height: 44.h,
              customBorderRadius: BorderRadius.circular(12.r),
              customTextStyle: AppStyle.font14_400Weight.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.w600,
              ),
              onPressed: () {},
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: CustomTextButton(
              text: 'Transfer',
              background: AppColors.darkSurface,
              isUpperCase: false,
              elevation: 0,
              height: 44.h,
              customBorderRadius: BorderRadius.circular(12.r),
              customTextStyle: AppStyle.font14_400Weight.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.w600,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
