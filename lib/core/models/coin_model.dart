class CoinModel {
  final String name;
  final String symbol;
  final String price;
  final bool isPositive;
  final String iconPath;

  const CoinModel({
    required this.name,
    required this.symbol,
    required this.price,
    required this.isPositive,
    required this.iconPath,
  });
}
