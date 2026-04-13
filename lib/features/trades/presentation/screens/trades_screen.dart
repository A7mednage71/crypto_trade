import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/presentation/widgets/home_app_bar.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/markets_tab_bar.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trade_convert_tab_body.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trade_fiat_tab_body.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trade_margin_tab_body.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trade_spot_tab_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TradesScreen extends StatelessWidget {
  const TradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        appBar: const HomeAppBar(),
        body: Column(
          children: [
            verticalSpace(8),
            const MarketsTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  BlocProvider(
                    create: (context) => ServicesLocator.convertCubit,
                    child: const TradeConvertTabBody(),
                  ),
                  const TradeSpotTabBody(),
                  BlocProvider(
                    create: (context) => ServicesLocator.marginCubit,
                    child: const TradeMarginTabBody(),
                  ),
                  BlocProvider(
                    create: (context) => ServicesLocator.fiatCubit,
                    child: const TradeFiatTabBody(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
