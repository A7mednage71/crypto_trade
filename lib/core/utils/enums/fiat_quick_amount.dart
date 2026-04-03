enum FiatQuickAmount {
  amount50(50.0),
  amount100(100.0),
  amount250(250.0),
  amount500(500.0),
  amount1000(1000.0),
  amount2500(2500.0);

  final double value;
  const FiatQuickAmount(this.value);

  String get label => '\$${value.toInt()}';
}
