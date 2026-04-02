import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/order_book_header.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/order_book_list.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/order_book_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBookSection extends StatelessWidget {
  const OrderBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderBookTabs(),
          Divider(color: AppColors.grey.withValues(alpha: 0.2), height: 1),
          OrderBookHeader(),
          OrderBookList(),
        ],
      ),
    );
  }
}
