import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradesFilterTabs extends StatefulWidget {
  const TradesFilterTabs({super.key});

  @override
  State<TradesFilterTabs> createState() => _TradesFilterTabsState();
}

class _TradesFilterTabsState extends State<TradesFilterTabs> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['Convert', 'Spot', 'Margin', 'Fiat'];
    return Container(
      height: 48.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = index == _selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() {
                _selectedIndex = index;
              }),
              child: Container(
                margin: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.darkBackground
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index],
                  style: AppStyle.font14_400Weight.copyWith(
                    color: isSelected ? AppColors.white : AppColors.grey,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
