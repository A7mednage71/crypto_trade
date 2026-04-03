import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/home/data/models/coins_dummy_model.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/search_coins_bottom_sheet_listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart' show Skeletonizer;

class CoinPickerSheet extends StatefulWidget {
  const CoinPickerSheet({super.key, required this.onCoinSelected});

  final Function(CoinResponseModel) onCoinSelected;

  @override
  State<CoinPickerSheet> createState() => CoinPickerSheetState();
}

class CoinPickerSheetState extends State<CoinPickerSheet> {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<String> searchNotifier = ValueNotifier("");

  @override
  void dispose() {
    searchController.dispose();
    searchNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.85.sh,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        children: [
          Container(
            width: 45.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: AppColors.lightGrey.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          verticalSpace(16),
          Text(
            'Select Currency',
            style: AppStyle.font20_600Weight.copyWith(color: AppColors.white),
          ),
          verticalSpace(16),
          CustomTextFormField(
            controller: searchController,
            hint: 'Search currency...',
            prefixIcon: true,
            prefixImage: 'assets/images/svg/search.svg',
            onChanged: (value) => searchNotifier.value = value.toLowerCase(),
            borderColor: AppColors.lightGrey.withValues(alpha: 0.1),
            bgColor: AppColors.lightGrey.withValues(alpha: 0.05),
            textInputType: TextInputType.text,
          ),
          verticalSpace(16),
          ShowBottomSheetCoinsBlocBuilder(
            searchNotifier: searchNotifier,
            widget: widget,
          ),
        ],
      ),
    );
  }
}

class ShowBottomSheetCoinsBlocBuilder extends StatelessWidget {
  const ShowBottomSheetCoinsBlocBuilder({
    super.key,
    required this.searchNotifier,
    required this.widget,
  });

  final ValueNotifier<String> searchNotifier;
  final CoinPickerSheet widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MarketsCubit, MarketsState>(
        buildWhen: (p, c) =>
            p.status != c.status || p.isLoadingMore != c.isLoadingMore,
        builder: (context, state) {
          switch (state.status) {
            case MarketsStatus.initial:
            case MarketsStatus.loading:
              return Skeletonizer(
                enabled: true,
                child: SearchCoinsBottomSheetListView(
                  filteredCoins:
                      CoinsDummyModel.dummyCoins + CoinsDummyModel.dummyCoins,
                ),
              );

            case MarketsStatus.failure:
              return FailureState(
                titleColor: AppColors.white,
                size: 150,
                onPressed: () => context.read<MarketsCubit>().getMarketsCoins(),
              );

            case MarketsStatus.success:
              return ValueListenableBuilder<String>(
                valueListenable: searchNotifier,
                builder: (context, query, _) {
                  final filteredCoins = state.coins.where((coin) {
                    return coin.name.toLowerCase().contains(query) ||
                        coin.symbol.toLowerCase().contains(query);
                  }).toList();

                  if (filteredCoins.isEmpty) {
                    return const EmptyState(
                      message: 'No coins found',
                      messageColor: AppColors.white,
                      animationSize: 150,
                    );
                  }

                  return SearchCoinsBottomSheetListView(
                    filteredCoins: filteredCoins,
                    onCoinSelected: widget.onCoinSelected,
                  );
                },
              );
          }
        },
      ),
    );
  }
}
