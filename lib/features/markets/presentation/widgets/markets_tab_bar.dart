import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketsTabBar extends StatelessWidget {
  const MarketsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        height: 50.h,
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: AppColors.overlay50,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            color: AppColors.darkSurface,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.grey,
          labelStyle: AppStyle.font14_400Weight.copyWith(
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: AppStyle.font14_400Weight,
          tabs: const [
            Tab(text: 'Convert'),
            Tab(text: 'Spot'),
            Tab(text: 'Margin'),
            Tab(text: 'Fiat'),
          ],
        ),
      ),
    );
  }
}
