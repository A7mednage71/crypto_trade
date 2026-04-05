import 'package:crypto_trade/features/coin_details/data/models/chart_request_model.dart';
import 'package:crypto_trade/features/coin_details/data/repos/coin_details_repo.dart';
import 'package:crypto_trade/features/coin_details/presentation/cubits/coin_details_cubit/coin_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinDetailsCubit extends Cubit<CoinDetailsState> {
  final CoinDetailsRepo _repo;

  CoinDetailsCubit(this._repo) : super(const CoinDetailsState());

  Future<void> fetchCoinDetails(
    String id, {
    String vsCurrency = 'usd',
    int days = 1,
  }) async {
    emit(state.copyWith(status: CoinDetailsStatus.loading));

    final detailsResult = await _repo.getCoinDetails(id);
    final chartResult = await _repo.getCoinMarketChart(
      id,
      ChartRequestModel(vsCurrency: vsCurrency, days: days),
    );

    detailsResult.when(
      success: (details) {
        chartResult.when(
          success: (chart) {
            emit(
              state.copyWith(
                status: CoinDetailsStatus.success,
                coinDetails: details,
                chartData: chart,
              ),
            );
          },
          failure: (error) {
            emit(
              state.copyWith(
                status: CoinDetailsStatus.failure,
                errorMessage: error.errMessages,
              ),
            );
          },
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: CoinDetailsStatus.failure,
            errorMessage: error.errMessages,
          ),
        );
      },
    );
  }

  Future<void> changeTimeframe(
    String id,
    int days, {
    String vsCurrency = 'usd',
  }) async {
    if (state.status == CoinDetailsStatus.success ||
        state.status == CoinDetailsStatus.chartLoading) {
      emit(state.copyWith(status: CoinDetailsStatus.chartLoading));

      final chartResult = await _repo.getCoinMarketChart(
        id,
        ChartRequestModel(vsCurrency: vsCurrency, days: days),
      );
      chartResult.when(
        success: (chart) {
          emit(
            state.copyWith(status: CoinDetailsStatus.success, chartData: chart),
          );
        },
        failure: (error) {
          emit(
            state.copyWith(
              status: CoinDetailsStatus.failure,
              errorMessage: error.errMessages,
            ),
          );
        },
      );
    }
  }
}
