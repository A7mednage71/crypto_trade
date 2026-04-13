import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coins_dummy_model.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_screen_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart' show Skeletonizer;

enum MarketTabType { convert, spot, margin, fiat }

class MarketCoinsBlocBuilder extends StatelessWidget {
  final MarketTabType tabType;

  const MarketCoinsBlocBuilder({required this.tabType, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (p, c) =>
          p.status != c.status ||
          p.isLoadingMore != c.isLoadingMore ||
          p.spotCoins.length != c.spotCoins.length ||
          p.convertCoins.length != c.convertCoins.length ||
          p.marginCoins.length != c.marginCoins.length ||
          p.fiatCoins.length != c.fiatCoins.length,
      builder: (context, state) {
        switch (state.status) {
          case MarketsStatus.initial:
          case MarketsStatus.loading:
            return Skeletonizer(
              enabled: true,
              containersColor: AppColors.lightGrey,
              child: MarketScreenListView(
                coins: CoinsDummyModel.dummyCoins + CoinsDummyModel.dummyCoins,
                tabType: tabType,
              ),
            );
          case MarketsStatus.success:
            final filteredCoins = switch (tabType) {
              MarketTabType.convert => state.convertCoins,
              MarketTabType.spot => state.spotCoins,
              MarketTabType.margin => state.marginCoins,
              MarketTabType.fiat => state.fiatCoins,
            };

            if (filteredCoins.isEmpty) {
              return EmptyState(
                message: "No coins found",
                animationSize: 100.h,
              );
            }
            return MarketScreenListView(coins: filteredCoins, tabType: tabType);
          case MarketsStatus.failure:
            return FailureState(
              titleColor: AppColors.white,
              message: state.errorMessage,
              onPressed: () => context.read<MarketsCubit>().getMarketsCoins(),
              size: 50.h,
            );
        }
      },
    );
  }
}
