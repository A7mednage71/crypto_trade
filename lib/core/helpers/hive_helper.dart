import 'package:crypto_trade/features/activity/data/models/activity_model.dart';
import 'package:crypto_trade/features/favorites/data/models/favorite_coin_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  HiveHelper._();
  static final HiveHelper _instance = HiveHelper._();
  factory HiveHelper() => _instance;

  // Box Names
  static const String favoritesBox = 'favorites_box';
  static const String activityBox = 'activity_box';

  /// [init] should be called in main or app_initi
  Future<void> init() async {
    // Initializing Hive for mobile
    await Hive.initFlutter();

    // Registering Adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(FavoriteCoinModelAdapter()); // typeId: 0
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ActivityHiveModelAdapter()); // typeId: 1
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ActivityTypeAdapter()); // typeId: 2
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(ActivityStatusAdapter()); // typeId: 3
    }

    await openBox<FavoriteCoinModel>(favoritesBox);
    await openBox<ActivityHiveModel>(activityBox);
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    return await Hive.openBox<T>(boxName);
  }

  Box<T> getBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }

  /// Clean all data (useful for Logout)
  Future<void> clearAllData() async {
    await Hive.deleteFromDisk();
  }
}
