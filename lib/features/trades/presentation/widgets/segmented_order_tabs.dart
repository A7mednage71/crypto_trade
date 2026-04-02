import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/enums/trade_order_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SegmentedOrderTabs extends StatefulWidget {
  const SegmentedOrderTabs({
    super.key,
    required this.onTabChanged,
    this.initialType = TradeOrderType.limit,
  });

  final Function(TradeOrderType) onTabChanged;
  final TradeOrderType initialType;

  @override
  State<SegmentedOrderTabs> createState() => _SegmentedOrderTabsState();
}

class _SegmentedOrderTabsState extends State<SegmentedOrderTabs> {
  late TradeOrderType _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialType;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGrey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.all(4.w),
      child: Row(
        children: TradeOrderType.values.map((type) {
          return OrderSegmentedTabItem(
            label: type.label,
            isSelected: type == _selectedType,
            onTap: () {
              if (_selectedType != type) {
                setState(() => _selectedType = type);
                widget.onTabChanged(type);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}

class OrderSegmentedTabItem extends StatelessWidget {
  const OrderSegmentedTabItem({
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
          duration: Duration(milliseconds: 250),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.lightGrey.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            label,
            style: AppStyle.font13_400Weight.copyWith(
              color: isSelected ? AppColors.white : AppColors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
