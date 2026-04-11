import 'package:crypto_trade/core/helpers/hive_helper.dart';
import 'package:crypto_trade/features/favorites/data/models/favorite_coin_model.dart';
import 'package:crypto_trade/features/favorites/data/repos/favorites_repo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesRepositoryImpl implements FavoritesRepo {
  final Box<FavoriteCoinModel> _box = HiveHelper().getBox<FavoriteCoinModel>(
    HiveHelper.favoritesBox,
  );
  @override
  Future<void> toggleFavorite(FavoriteCoinModel coin) async {
    if (isFavorite(coin.id)) {
      await removeFavorite(coin.id);
    } else {
      await _box.put(coin.id, coin);
    }
  }

  @override
  Future<void> removeFavorite(String coinId) async {
    await _box.delete(coinId);
  }

  @override
  bool isFavorite(String coinId) {
    return _box.containsKey(coinId);
  }

  @override
  List<FavoriteCoinModel> getFavorites() {
    return _box.values.toList();
  }

  @override
  Box<FavoriteCoinModel> get favoriteBox => _box;
}
