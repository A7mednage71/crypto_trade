enum CoinTimeframe {
  hour1('1H', 1),
  day1('1D', 1),
  week1('1W', 7),
  month1('1M', 30),
  year1('1Y', 365);

  final String label;
  final int days;

  const CoinTimeframe(this.label, this.days);
}
