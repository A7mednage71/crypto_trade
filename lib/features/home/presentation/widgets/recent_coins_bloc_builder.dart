import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coins_dummy_model.dart';
import 'package:crypto_trade/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:crypto_trade/features/home/presentation/widgets/coin_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart' show Skeletonizer;

class RecentCoinsBlocBuilder extends StatelessWidget {
  const RecentCoinsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'Recent Coin',
            style: AppStyle.font18_600Weight.copyWith(color: AppColors.black),
          ),
        ),
        verticalSpace(10),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (p, c) => p.recentCoinsStatus != c.recentCoinsStatus,
          builder: (context, state) {
            switch (state.recentCoinsStatus) {
              case HomeStatus.loading:
                return Skeletonizer(
                  enabled: true,
                  child: CoinSectionWidget(coins: CoinsDummyModel.dummyCoins),
                );
              case HomeStatus.success:
                if (state.recentCoins.isEmpty) {
                  return EmptyState(
                    message: "No recent coins found",
                    animationSize: 100.h,
                  );
                }
                return CoinSectionWidget(coins: state.recentCoins);
              case HomeStatus.failure:
                return FailureState(
                  message: state.errorMessage,
                  onPressed: () => context.read<HomeCubit>().fetchRecentCoins(),
                  size: 50.h,
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
