import 'package:flutter/material.dart';

enum FiatPaymentMethod {
  creditCard('Credit Card', Icons.credit_card_rounded),
  bankTransfer('Bank Transfer', Icons.account_balance_rounded),
  vodafoneCash('Vodafone Cash', Icons.account_balance_wallet_rounded);

  final String name;
  final IconData icon;

  const FiatPaymentMethod(this.name, this.icon);
}
