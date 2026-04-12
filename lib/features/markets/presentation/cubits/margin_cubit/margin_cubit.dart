import 'package:crypto_trade/core/utils/enums/margin_mode.dart';
import 'package:crypto_trade/core/utils/enums/risk_level.dart';
import 'package:crypto_trade/core/utils/enums/trade_side.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'margin_state.dart';

class MarginCubit extends Cubit<MarginState> {
  final TextEditingController amountController = TextEditingController();

  MarginCubit() : super(const MarginState()) {
    amountController.addListener(_onAmountTextChanged);
  }

  void _onAmountTextChanged() {
    final amount = double.tryParse(amountController.text) ?? 0.0;
    if (amount != state.amountToTrade) {
      updateMarginAmount(amount);
    }
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

  void updateAvailableBalance(double balance) {
    emit(state.copyWith(availableBalance: balance));
    _updateMarginCalculations();
  }

  void _updateMarginCalculations() {
    if (state.selectedMarginCoin == null) return;

    final currentPrice = state.selectedMarginCoin!.currentPrice;
    final leverage = state.leverage;
    final balance = state.availableBalance;
    final amountInput = state.amountToTrade;

    final maxBuy = (balance * leverage) / currentPrice;
    final totalOrderValueUSD = amountInput * leverage;
    final actualOrderAmount = totalOrderValueUSD / currentPrice;
    final liquidationPrice = currentPrice * (1 - (1 / leverage) + 0.01);
    final riskPercentage = leverage / 20.0;

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
    amountController.clear();
    emit(
      state.copyWith(
        amountToTrade: 0.0,
        tradeStatus: TradeStatus.initial,
        actualOrderAmount: 0.0,
        totalOrderValueUSD: 0.0,
        leverage: 1.0,
        riskLevel: RiskLevel.low,
        riskPercentage: 0.0,
        liquidationPrice: 0.0,
        maxBuy: 0.0,
        marginMode: MarginMode.cross,
        selectedMarginCoin: null,
      ),
    );
  }

  @override
  Future<void> close() {
    amountController.dispose();
    return super.close();
  }
}
