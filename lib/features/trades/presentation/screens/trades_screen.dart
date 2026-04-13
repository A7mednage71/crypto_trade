import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/enums/market_tab_type.dart';
import 'package:crypto_trade/features/main_layout/presentation/cubits/app_navigation_cubit/app_navigation_cubit.dart';
import 'package:crypto_trade/features/main_layout/presentation/cubits/app_navigation_cubit/app_navigation_state.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/markets_tab_bar.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trade_convert_tab_body.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trade_fiat_tab_body.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trade_margin_tab_body.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trade_spot_tab_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TradesScreen extends StatefulWidget {
  const TradesScreen({super.key});

  @override
  State<TradesScreen> createState() => _TradesScreenState();
}

class _TradesScreenState extends State<TradesScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AppNavigationCubit>();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: cubit.state.selectedTradesTab.index,
    );

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        cubit.changeTradesTab(MarketTabType.values[_tabController.index]);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppNavigationCubit, AppNavigationState>(
      listenWhen: (p, c) => p.selectedTradesTab != c.selectedTradesTab,
      listener: (context, state) {
        if (_tabController.index != state.selectedTradesTab.index) {
          _tabController.animateTo(state.selectedTradesTab.index);
        }
      },
      child: Column(
        children: [
          verticalSpace(16),
          MarketsTabBar(controller: _tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
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
    );
  }
}
