import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coins_dummy_model.dart';
import 'package:crypto_trade/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:crypto_trade/features/home/presentation/widgets/coin_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopCoinsBlocBuilder extends StatelessWidget {
  const TopCoinsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'Top Coins',
            style: AppStyle.font18_600Weight.copyWith(color: AppColors.black),
          ),
        ),
        verticalSpace(10),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (p, c) => p.topCoinsStatus != c.topCoinsStatus,
          builder: (context, state) {
            switch (state.topCoinsStatus) {
              case HomeStatus.loading:
                return Skeletonizer(
                  enabled: true,
                  child: CoinSectionWidget(coins: CoinsDummyModel.dummyCoins),
                );
              case HomeStatus.success:
                if (state.topCoins.isEmpty) {
                  return EmptyState(
                    message: "No top coins found",
                    animationSize: 100.h,
                  );
                }
                return CoinSectionWidget(coins: state.topCoins);
              case HomeStatus.failure:
                return FailureState(
                  size: 50.h,
                  message: state.errorMessage,
                  onPressed: () => context.read<HomeCubit>().fetchTopCoins(),
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
