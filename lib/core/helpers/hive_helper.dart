import 'package:crypto_trade/features/favorites/data/models/favorite_coin_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  // 1. Singleton Pattern
  HiveHelper._();
  static final HiveHelper _instance = HiveHelper._();
  factory HiveHelper() => _instance;

  // Box Names
  static const String favoritesBox = 'favorites_box';

  /// [init] should be called in main or app_initi
  Future<void> init() async {
    // a. Initializing Hive for mobile
    await Hive.initFlutter();

    // b. Registering Adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(FavoriteCoinModelAdapter());
    }

    // c. Opening Basic Boxes
    await openBox<FavoriteCoinModel>(favoritesBox);
  }

  /// Method to open any Box generically
  Future<Box<T>> openBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    return await Hive.openBox<T>(boxName);
  }

  /// Method to get an open Box
  Box<T> getBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }

  /// Clean all data (useful for Logout)
  Future<void> clearAllData() async {
    await Hive.deleteFromDisk();
  }
}
