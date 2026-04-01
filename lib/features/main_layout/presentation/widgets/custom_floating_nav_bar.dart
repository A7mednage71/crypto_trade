import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/main_layout/presentation/widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFloatingNavBar extends StatelessWidget {
  final NavItem currentItem;
  final ValueChanged<NavItem> onTap;

  const CustomFloatingNavBar({
    super.key,
    required this.currentItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.r),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1B232A),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: NavItem.values.map((item) => _buildNavItem(item)).toList(),
      ),
    );
  }

  Widget _buildNavItem(NavItem item) {
    final isActive = currentItem == item;
    final color = isActive ? AppColors.primary : AppColors.grey;
    return GestureDetector(
      onTap: () => onTap(item),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              item.iconPath,
              width: 24.w,
              height: 24.w,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            verticalSpace(4),
            Text(
              item.label,
              style: AppStyle.font12_400Weight.copyWith(
                color: color,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
