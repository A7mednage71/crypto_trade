import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBookTabs extends StatefulWidget {
  const OrderBookTabs({super.key, this.onTabChanged});
  final Function(int)? onTabChanged;

  @override
  State<OrderBookTabs> createState() => _OrderBookTabsState();
}

class _OrderBookTabsState extends State<OrderBookTabs> {
  int _selectedIndex = 1;
  final List<String> _tabs = ['Open Order (2)', 'Order Books', 'Market Trades'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.lightGrey.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          return OrderBookTabItem(
            label: _tabs[index],
            isSelected: index == _selectedIndex,
            onTap: () {
              setState(() => _selectedIndex = index);
              widget.onTabChanged?.call(index);
            },
          );
        }),
      ),
    );
  }
}

class OrderBookTabItem extends StatelessWidget {
  const OrderBookTabItem({
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
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.grey.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.font14_400Weight.copyWith(
              color: isSelected
                  ? AppColors.darkBackground
                  : AppColors.lightGrey,
            ),
          ),
        ),
      ),
    );
  }
}
