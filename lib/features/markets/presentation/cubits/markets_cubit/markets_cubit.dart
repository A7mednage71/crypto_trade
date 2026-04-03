import 'package:crypto_trade/features/home/data/models/coin_markets_request_model.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/markets/data/repos/markets_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'markets_cubit.freezed.dart';
part 'markets_state.dart';

class MarketsCubit extends Cubit<MarketsState> {
  final MarketsRepo _marketsRepo;

  MarketsCubit(this._marketsRepo) : super(const MarketsState());

  Future<void> getMarketsCoins({int page = 1}) async {
    if (page == 1) {
      emit(
        state.copyWith(
          status: MarketsStatus.loading,
          currentPage: 1,
          coins: [],
        ),
      );
    } else {
      emit(state.copyWith(isLoadingMore: true));
    }

    final result = await _marketsRepo.getMarketsCoins(
      CoinMarketsRequestModel(perPage: 15, page: page),
    );

    result.when(
      success: (newCoins) {
        final List<CoinResponseModel> updatedCoins = page == 1
            ? newCoins
            : [...state.coins, ...newCoins];

        emit(
          state.copyWith(
            status: MarketsStatus.success,
            coins: updatedCoins,
            currentPage: page,
            isLoadingMore: false,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: MarketsStatus.failure,
            errorMessage: error.errMessages,
            isLoadingMore: false,
          ),
        );
      },
    );
  }

  void loadMore() {
    if (state.isLoadingMore || state.status == MarketsStatus.loading) return;
    getMarketsCoins(page: state.currentPage + 1);
  }

  void selectConvertCoin({
    required bool isFrom,
    required CoinResponseModel coin,
  }) {
    if (isFrom) {
      emit(state.copyWith(fromCoin: coin));
    } else {
      emit(state.copyWith(toCoin: coin));
    }
    _calculateRate();
    updateConvertAmounts(isFromUpdate: true, amount: state.fromAmount);
  }

  void _calculateRate() {
    // How many units of currency (B) are equal to one unit of currency (A)?
    if (state.fromCoin != null && state.toCoin != null) {
      final double newRate =
          state.fromCoin!.currentPrice / state.toCoin!.currentPrice;
      emit(state.copyWith(rate: newRate));
    }
  }

  void updateConvertAmounts({
    required bool isFromUpdate,
    required double amount,
  }) {
    if (state.rate == 0) return;

    if (isFromUpdate) {
      emit(state.copyWith(fromAmount: amount, toAmount: amount * state.rate));
    } else {
      emit(state.copyWith(toAmount: amount, fromAmount: amount / state.rate));
    }
  }

  void swapConvertCurrencies() {
    if (state.fromCoin == null || state.toCoin == null) return;
    final tempCoin = state.fromCoin;
    final tempAmount = state.fromAmount;

    emit(
      state.copyWith(
        fromCoin: state.toCoin,
        toCoin: tempCoin,
        fromAmount: state.toAmount,
        toAmount: tempAmount,
      ),
    );
    _calculateRate();
  }
}
