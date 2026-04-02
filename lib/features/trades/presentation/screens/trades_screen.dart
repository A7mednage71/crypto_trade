import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/order_book_section.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trade_action_buttons.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trade_action_sheet.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trades_filter_tabs.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trades_screen_header.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trading_chart_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradesScreen extends StatelessWidget {
  const TradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              verticalSpace(24),
              TradesScreenHeader(),
              verticalSpace(24),
              TradesFilterTabs(),
              verticalSpace(24),
              TradingChartSection(),
              verticalSpace(24),
              TradeActionButtons(
                onBuyTap: () => _showTradeActionSheet(context, true),
                onSellTap: () => _showTradeActionSheet(context, false),
              ),
              verticalSpace(16),
              OrderBookSection(),
              verticalSpace(100),
            ],
          ),
        ),
      ),
    );
  }

  void _showTradeActionSheet(BuildContext context, bool isBuy) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: TradeActionSheet(isBuy: isBuy),
        );
      },
    );
  }
}
