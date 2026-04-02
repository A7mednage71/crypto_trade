import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coins_dummy_model.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_screen_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart' show Skeletonizer;

class MarketCoinsBlocBuilder extends StatelessWidget {
  const MarketCoinsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        switch (state.status) {
          case MarketsStatus.initial:
          case MarketsStatus.loading:
            return Skeletonizer(
              enabled: true,
              child: MarketScreenListView(coins: CoinsDummyModel.dummyCoins),
            );
          case MarketsStatus.success:
            if (state.coins.isEmpty) {
              return EmptyState(
                message: "No coins found",
                animationSize: 100.h,
              );
            }
            return MarketScreenListView(coins: state.coins);
          case MarketsStatus.failure:
            return FailureState(
              message: state.errorMessage,
              onPressed: () => context.read<MarketsCubit>().getMarketsCoins(),
              size: 50.h,
            );
        }
      },
    );
  }
}
