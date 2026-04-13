import 'package:flutter/material.dart';

enum MarketTabType {
  convert(Icons.swap_horiz_rounded, 'Quick Convert'),
  spot(Icons.currency_exchange_rounded, 'Trade Spot'),
  margin(Icons.trending_up_rounded, 'Open Margin Position'),
  fiat(Icons.account_balance_wallet_rounded, 'Deposit');

  final IconData icon;
  final String label;

  const MarketTabType(this.icon, this.label);

  String getActionLabel([String? symbol]) {
    if (this == MarketTabType.fiat && symbol != null) {
      return '$label ${symbol.toUpperCase()}';
    }
    return label;
  }
}
