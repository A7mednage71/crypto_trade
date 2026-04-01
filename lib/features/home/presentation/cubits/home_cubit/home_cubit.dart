import 'package:crypto_trade/features/home/data/models/coin_markets_request_model.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/core/utils/enums/coin_order_enum.dart';
import 'package:crypto_trade/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState());

  Future<void> fetchTopCoins() async {
    emit(state.copyWith(topCoinsStatus: HomeStatus.loading));

    final result = await _homeRepo.getHomeCoins(
      CoinMarketsRequestModel(order: CoinOrder.marketCapDesc),
    );

    result.when(
      success: (coins) => emit(
        state.copyWith(topCoinsStatus: HomeStatus.success, topCoins: coins),
      ),
      failure: (failure) => emit(
        state.copyWith(
          topCoinsStatus: HomeStatus.failure,
          errorMessage: failure.errMessages,
        ),
      ),
    );
  }

  Future<void> fetchRecentCoins() async {
    emit(state.copyWith(recentCoinsStatus: HomeStatus.loading));

    final result = await _homeRepo.getHomeCoins(
      CoinMarketsRequestModel(order: CoinOrder.volumeDesc),
    );

    result.when(
      success: (coins) => emit(
        state.copyWith(
          recentCoinsStatus: HomeStatus.success,
          recentCoins: coins,
        ),
      ),
      failure: (failure) => emit(
        state.copyWith(
          recentCoinsStatus: HomeStatus.failure,
          errorMessage: failure.errMessages,
        ),
      ),
    );
  }

  Future<void> getHomeData() async {
    emit(state.copyWith(errorMessage: null));
    await Future.wait([fetchTopCoins(), fetchRecentCoins()]);
  }
}
