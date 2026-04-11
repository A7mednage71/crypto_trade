import 'package:hive/hive.dart';

part 'favorite_coin_model.g.dart';

@HiveType(typeId: 0)
class FavoriteCoinModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String symbol;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final double currentPrice;

  @HiveField(5)
  final double priceChangePercentage24h;

  FavoriteCoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage24h,
  });
}
