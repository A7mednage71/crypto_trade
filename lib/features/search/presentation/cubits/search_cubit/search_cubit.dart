import 'package:crypto_trade/core/utils/logic/debouncer.dart';
import 'package:crypto_trade/features/search/data/models/search_result_model.dart';
import 'package:crypto_trade/features/search/data/repos/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;

  SearchCubit(this._searchRepo) : super(const SearchState());

  final TextEditingController searchController = TextEditingController();

  final Debouncer debouncer = Debouncer(const Duration(milliseconds: 500));

  /// Debounced new Search Function
  Future<void> onSearchChanged() async {
    debouncer.call(() async {
      if (searchController.text.isEmpty) {
        emit(state.copyWith(status: SearchStatus.initial, results: []));
        return;
      }
      await searchCoins(searchController.text.trim());
    });
  }

  Future<void> searchCoins(String query) async {
    emit(state.copyWith(status: SearchStatus.loading, errorMessage: null));

    final result = await _searchRepo.searchCoins(query.trim());

    result.when(
      success: (coins) {
        if (coins.isEmpty) {
          emit(state.copyWith(status: SearchStatus.empty, results: []));
        } else {
          emit(state.copyWith(status: SearchStatus.success, results: coins));
        }
      },
      failure: (failure) => emit(
        state.copyWith(
          status: SearchStatus.error,
          errorMessage: failure.errMessages,
        ),
      ),
    );
  }

  void clearSearch() {
    emit(state.copyWith(status: SearchStatus.initial, results: []));
  }
}
