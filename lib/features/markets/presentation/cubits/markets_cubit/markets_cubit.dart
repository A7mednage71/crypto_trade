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

  Future<void> getMarketsCoins() async {
    emit(state.copyWith(status: MarketsStatus.loading));
    final result = await _marketsRepo.getMarketsCoins(
      CoinMarketsRequestModel(perPage: 30),
    );
    result.when(
      success: (coins) {
        emit(state.copyWith(status: MarketsStatus.success, coins: coins));
      },
      failure: (error) {
        emit(state.copyWith(status: MarketsStatus.failure, errorMessage: error.errMessages));
      },
    );
  }
}

