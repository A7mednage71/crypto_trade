import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_details_args.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_details_dummy_data.dart';
import 'package:crypto_trade/features/coin_details/data/models/market_chart_response_model.dart';
import 'package:crypto_trade/features/coin_details/presentation/cubits/coin_details_cubit/coin_details_cubit.dart';
import 'package:crypto_trade/features/coin_details/presentation/cubits/coin_details_cubit/coin_details_state.dart';
import 'package:crypto_trade/features/coin_details/presentation/widgets/about_coin_widget.dart';
import 'package:crypto_trade/features/coin_details/presentation/widgets/action_buttons_widget.dart';
import 'package:crypto_trade/features/coin_details/presentation/widgets/coin_chart_widget.dart';
import 'package:crypto_trade/features/coin_details/presentation/widgets/coin_header_widget.dart';
import 'package:crypto_trade/features/coin_details/presentation/widgets/price_section_widget.dart';
import 'package:crypto_trade/features/coin_details/presentation/widgets/statistics_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CoinDetailsScreen extends StatelessWidget {
  final CoinDetailsArgs args;

  const CoinDetailsScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ServicesLocator.locator<CoinDetailsCubit>()
            ..fetchCoinDetails(args.coinId),
      child: Scaffold(
        appBar: CustomAppBar(title: args.coinName),
        body: SafeArea(
          child: BlocBuilder<CoinDetailsCubit, CoinDetailsState>(
            builder: (context, state) {
              switch (state.status) {
                case CoinDetailsStatus.initial:
                case CoinDetailsStatus.loading:
                  return Skeletonizer(
                    enabled: true,
                    ignoreContainers: true,
                    containersColor: AppColors.grey,
                    effect: const ShimmerEffect(
                      baseColor: AppColors.skeletonBase,
                      highlightColor: AppColors.skeletonHighlight,
                    ),
                    child: _buildContent(
                      context,
                      CoinDetailsDummyData.dummyDetails,
                      CoinDetailsDummyData.dummyChart,
                    ),
                  );
                case CoinDetailsStatus.failure:
                  return FailureState(
                    size: 150.h,
                    title: "Failed to load coin details",
                    message: state.errorMessage,
                    titleColor: Colors.white,
                    onPressed: () => context
                        .read<CoinDetailsCubit>()
                        .fetchCoinDetails(args.coinId),
                  );
                case CoinDetailsStatus.success:
                case CoinDetailsStatus.chartLoading:
                  return _buildContent(
                    context,
                    state.coinDetails!,
                    state.chartData!,
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    CoinDetailResponseModel details,
    MarketChartResponseModel chart,
  ) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              verticalSpace(10),
              CoinHeaderWidget(coinDetails: details),
              verticalSpace(24),
              PriceSectionWidget(marketData: details.marketData),
              verticalSpace(24),
              CoinChartWidget(coinId: details.id, chartData: chart),
              verticalSpace(24),
              StatisticsGridWidget(marketData: details.marketData),
              verticalSpace(20),
              AboutCoinWidget(description: details.description.en),
              verticalSpace(24),
              ActionButtonsWidget(),
              verticalSpace(32),
            ]),
          ),
        ),
      ],
    );
  }
}
