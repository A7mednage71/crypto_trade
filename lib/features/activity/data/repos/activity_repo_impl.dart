import 'package:crypto_trade/core/helpers/hive_helper.dart';
import 'package:crypto_trade/features/activity/data/models/activity_model.dart';
import 'package:crypto_trade/features/activity/data/repos/activity_repo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ActivityRepoImpl implements ActivityRepo {
  final Box<ActivityHiveModel> _box = HiveHelper().getBox<ActivityHiveModel>(
    HiveHelper.activityBox,
  );

  @override
  Future<void> logActivity(ActivityHiveModel activity) async {
    await _box.put(activity.id, activity);
  }

  @override
  List<ActivityHiveModel> getActivities() {
    final items = _box.values.toList();
    items.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return items;
  }

  @override
  Future<void> clearAll() async {
    await _box.clear();
  }
}
