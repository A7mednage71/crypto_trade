enum TradeSide {
  long,
  short;

  bool get isLong => this == TradeSide.long;
  bool get isShort => this == TradeSide.short;
}
