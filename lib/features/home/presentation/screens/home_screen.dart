import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:crypto_trade/features/home/presentation/widgets/home_services_grid_view.dart';
import 'package:crypto_trade/features/home/presentation/widgets/market_overview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().getHomeData(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpace(24),
            const HomeServicesGridView(),
            const MarketOverviewWidget(),
          ],
        ),
      ),
    );
  }
}
