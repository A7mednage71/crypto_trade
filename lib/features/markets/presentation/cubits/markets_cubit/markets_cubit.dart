import 'package:crypto_trade/core/utils/enums/margin_mode.dart';
import 'package:crypto_trade/core/utils/enums/risk_level.dart';
import 'package:crypto_trade/core/utils/enums/trade_side.dart';
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

  void changeLeverage(double value) {
    emit(state.copyWith(leverage: value));
    _updateMarginCalculations();
  }

  void changeMarginMode(MarginMode mode) {
    emit(state.copyWith(marginMode: mode));
  }

  void selectMarginCoin(CoinResponseModel coin) {
    emit(state.copyWith(selectedMarginCoin: coin));
    _updateMarginCalculations();
  }

  void updateMarginAmount(double amount) {
    emit(state.copyWith(amountToTrade: amount));
    _updateMarginCalculations();
  }

  /// Recalculates all margin-related metrics based on the current state.
  ///
  /// This method is the central source of truth for the Margin Trading business logic.
  /// It follows standard fintech rules for crypto trading:
  ///
  /// 1. **Ceiling (Max Buy)**: The absolute maximum quantity of the asset the user can
  ///    purchase given their balance and selected leverage.
  ///    Formula: (Available Balance * Leverage) / Current Price
  ///
  /// 2. **Execution (Actual Order)**: The specific quantity of tokens to be purchased
  ///    based on the user's manual input and leverage.
  ///    Formula: (Input Amount * Leverage) / Current Price
  ///
  /// 3. **Position Value**: The total USD exposure of the trade after applying leverage.
  ///    Formula: Input Amount * Leverage
  ///
  /// 4. **Liquidation Price**: The price at which the position will be forcibly closed.
  ///    Includes a 1% safety maintenance margin.
  ///    Formula: Entry Price * (1 - (1 / Leverage) + 0.01)
  ///
  /// 5. **Risk Assessment**: Determines the RiskLevel Enum based on leverage thresholds.
  void _updateMarginCalculations() {
    if (state.selectedMarginCoin == null) return;

    final currentPrice = state.selectedMarginCoin!.currentPrice;
    final leverage = state.leverage;
    final balance = state.availableBalance;
    final amountInput = state.amountToTrade;

    // 1. Calculate the account's ultimate buying power (USD ceiling / price)
    final maxBuy = (balance * leverage) / currentPrice;

    // 2. Calculate the active commitment in USD value
    final totalOrderValueUSD = amountInput * leverage;

    // 3. Calculate the actual token quantity for the order
    final actualOrderAmount = totalOrderValueUSD / currentPrice;

    // 4. Calculate the risk threshold (Liquidation Price) with 1% maintenance margin
    // Formula: EntryPrice * (1 - (1/Leverage) + 0.01)
    final liquidationPrice = currentPrice * (1 - (1 / leverage) + 0.01);

    // 5. Calculate reactive risk percentage for visual meters
    // Risk Percentage: leverage / 20.0
    final riskPercentage = leverage / 20.0;

    // 6. Map leverage to definitive RiskLevel Enums
    RiskLevel riskLevel;
    if (leverage <= 5) {
      riskLevel = RiskLevel.low;
    } else if (leverage <= 12) {
      riskLevel = RiskLevel.moderate;
    } else {
      riskLevel = RiskLevel.high;
    }

    emit(
      state.copyWith(
        maxBuy: maxBuy,
        liquidationPrice: liquidationPrice,
        riskPercentage: riskPercentage,
        riskLevel: riskLevel,
        totalOrderValueUSD: totalOrderValueUSD,
        actualOrderAmount: actualOrderAmount,
      ),
    );
  }

  void openMarginPosition(TradeSide side) async {
    emit(state.copyWith(tradeStatus: TradeStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(tradeStatus: TradeStatus.success));
  }

  void resetForm() {
    emit(
      state.copyWith(
        amountToTrade: 0.0,
        tradeStatus: TradeStatus.initial,
        actualOrderAmount: 0.0,
        totalOrderValueUSD: 0.0,
      ),
    );
  }

  // --- Fiat Deposit Logic ---

  void updateFiatAmount(double amount) {
    emit(state.copyWith(fiatDepositAmount: amount));
  }

  void selectPaymentMethod(int index) {
    emit(state.copyWith(selectedPaymentMethodIndex: index));
  }

  Future<void> depositFiat(double amount) async {
    if (amount <= 0) return;
    emit(state.copyWith(tradeStatus: TradeStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    final newBalance = state.availableBalance + amount;
    emit(
      state.copyWith(
        tradeStatus: TradeStatus.success,
        availableBalance: newBalance,
        fiatDepositAmount: 0.0,
      ),
    );
  }
}
