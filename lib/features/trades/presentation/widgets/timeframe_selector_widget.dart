import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeframeSelectorWidget extends StatefulWidget {
  const TimeframeSelectorWidget({super.key});

  @override
  State<TimeframeSelectorWidget> createState() =>
      _TimeframeSelectorWidgetState();
}

class _TimeframeSelectorWidgetState extends State<TimeframeSelectorWidget> {
  int _selectedIndex = 0;
  final List<String> times = ['1m', '5m', '15m', '1h', '1d', 'More'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(times.length, (index) {
            return TimeframeItem(
              label: times[index],
              isSelected: index == _selectedIndex,
              onTap: () => setState(() => _selectedIndex = index),
            );
          }),
          Icon(Icons.fullscreen_rounded, color: AppColors.grey, size: 20.sp),
        ],
      ),
    );
  }
}

class TimeframeItem extends StatelessWidget {
  const TimeframeItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.grey.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: AppStyle.font12_400Weight.copyWith(
            color: isSelected ? AppColors.white : AppColors.grey,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
