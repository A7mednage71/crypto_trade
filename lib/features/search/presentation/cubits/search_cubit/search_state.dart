part of 'search_cubit.dart';

enum SearchStatus { initial, loading, success, empty, error }

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default([]) List<SearchResultModel> results,
    String? errorMessage,
  }) = _SearchState;
}
