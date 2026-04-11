import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:crypto_trade/features/search/presentation/widgets/search_empty_view.dart';
import 'package:crypto_trade/features/search/presentation/widgets/search_initial_view.dart';
import 'package:crypto_trade/features/search/presentation/widgets/search_loading_view.dart';
import 'package:crypto_trade/features/search/presentation/widgets/search_result_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultViewBody extends StatelessWidget {
  const SearchResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return switch (state.status) {
            SearchStatus.initial => const SearchInitialView(),
            SearchStatus.loading => SearchLoadingView(),
            SearchStatus.success => SearchResultGridView(coins: state.results),
            SearchStatus.empty => SearchEmptyView(),
            SearchStatus.error => FailureState(
              size: 100.h,
              title: "Something went wrong",
              message: state.errorMessage,
              titleColor: Colors.white,
              onPressed: () => searchCubit.searchCoins(
                searchCubit.searchController.text.trim(),
              ),
            ),
          };
        },
      ),
    );
  }
}
