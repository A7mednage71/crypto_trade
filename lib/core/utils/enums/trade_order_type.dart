enum TradeOrderType {
  limit('Limit'),
  market('Market'),
  stopLimit('Stop Limit');

  final String label;
  const TradeOrderType(this.label);
}
