import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.overlay50,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          _buildActionItem(
            icon: Assets.imagesSvgCoin,
            title: 'Deposit',
            onTap: () {},
          ),
          Divider(
            color: AppColors.grey.withValues(alpha: 0.1),
            height: 1,
            indent: 16.w,
            endIndent: 16.w,
          ),
          _buildActionItem(
            icon: Assets.imagesSvgWalletTick,
            title: 'Withdrawals',
            onTap: () {},
          ),
          Divider(
            color: AppColors.grey.withValues(alpha: 0.1),
            height: 1,
            indent: 16.w,
            endIndent: 16.w,
          ),
          _buildActionItem(
            icon: Assets.imagesSvgShoppingCart,
            title: 'Buy Order',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24.w,
              height: 24.w,
              colorFilter: const ColorFilter.mode(
                AppColors.grey,
                BlendMode.srcIn,
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Text(
                title,
                style: AppStyle.font14_400Weight.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.grey, size: 14.w),
          ],
        ),
      ),
    );
  }
}
