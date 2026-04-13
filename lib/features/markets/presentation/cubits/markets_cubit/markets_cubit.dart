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
          spotCoins: [],
          convertCoins: [],
          marginCoins: [],
          fiatCoins: [],
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
        final List<CoinResponseModel> updatedSpot = page == 1
            ? newCoins
            : [...state.spotCoins, ...newCoins];

        final List<CoinResponseModel> updatedConvert = updatedSpot
            .where(
              (c) => [
                'btc',
                'eth',
                'sol',
                'bnb',
                'usdt',
                'usdc',
              ].contains(c.symbol.toLowerCase()),
            )
            .toList();

        final List<CoinResponseModel> updatedMargin = updatedSpot
            .where(
              (c) =>
                  (c.marketCapRank != null && c.marketCapRank! <= 30) ||
                  (c.priceChangePercentage24h.abs() > 5),
            )
            .toList();

        final List<CoinResponseModel> updatedFiat = updatedSpot
            .where(
              (c) => [
                'usdt',
                'usdc',
                'busd',
                'pyusd',
              ].contains(c.symbol.toLowerCase()),
            )
            .toList();

        emit(
          state.copyWith(
            status: MarketsStatus.success,
            spotCoins: updatedSpot,
            convertCoins: updatedConvert,
            marginCoins: updatedMargin,
            fiatCoins: updatedFiat,
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
}
