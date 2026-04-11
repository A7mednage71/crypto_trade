import 'package:crypto_trade/features/favorites/data/models/favorite_coin_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class FavoritesRepo {
  Future<void> toggleFavorite(FavoriteCoinModel coin);
  Future<void> removeFavorite(String coinId);
  bool isFavorite(String coinId);
  List<FavoriteCoinModel> getFavorites();
  Box<FavoriteCoinModel> get favoriteBox;
}
