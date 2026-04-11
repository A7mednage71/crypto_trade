import 'package:crypto_trade/features/activity/data/models/activity_model.dart';

abstract class ActivityRepo {
  Future<void> logActivity(ActivityHiveModel activity);
  List<ActivityHiveModel> getActivities();
  Future<void> clearAll();
}
