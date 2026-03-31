import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/presentation/widgets/home_app_bar.dart';
import 'package:crypto_trade/features/home/presentation/widgets/home_services_grid_view.dart';
import 'package:crypto_trade/features/home/presentation/widgets/market_overview_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HomeAppBar(),
            verticalSpace(24),
            HomeServicesGridView(),
            MarketOverviewWidget(),
          ],
        ),
      ),
    );
  }
}
