import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/presentation/widgets/home_app_bar.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_screen_list_view.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/markets_tab_bar.dart';
import 'package:flutter/material.dart';

class MarketsScreen extends StatelessWidget {
  const MarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        appBar: const HomeAppBar(),
        body: Column(
          children: [
            verticalSpace(16),
            MarketsTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  MarketScreenListView(),
                  MarketScreenListView(),
                  MarketScreenListView(),
                  MarketScreenListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
