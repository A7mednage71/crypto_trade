import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/presentation/widgets/home_app_bar.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_coins_bloc_builder.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/markets_tab_bar.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/convert_tab_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketsScreen extends StatelessWidget {
  const MarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesLocator.marketsCubit..getMarketsCoins(),
      child: DefaultTabController(
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
                    ConvertTabBody(),
                    MarketCoinsBlocBuilder(),
                    // Playing with borrowed money
                    MarketCoinsBlocBuilder(),
                    MarketCoinsBlocBuilder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
