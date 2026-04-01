part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus topCoinsStatus,
    @Default(HomeStatus.initial) HomeStatus recentCoinsStatus,
    @Default([]) List<CoinResponseModel> recentCoins,
    @Default([]) List<CoinResponseModel> topCoins,
    String? errorMessage,
  }) = _HomeState;
}
