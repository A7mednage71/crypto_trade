import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingBottomNavBar extends StatelessWidget {
  const FloatingBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Assets.imagesSvgHome, 'Home', true),
          _buildNavItem(Assets.imagesSvgMarket, 'Markets', false),
          _buildNavItem(Assets.imagesSvgTrades, 'Trades', false),
          _buildNavItem(Assets.imagesSvgActivity, 'Activity', false),
          _buildNavItem(Assets.imagesSvgWallet, 'Wallets', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, bool isActive) {
    final color = isActive ? AppColors.primary : AppColors.grey;
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 22.w,
            height: 22.w,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          verticalSpace(4),
          Text(label, style: AppStyle.font10_400Weight.copyWith(color: color)),
        ],
      ),
    );
  }
}
