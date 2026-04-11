import 'package:crypto_trade/features/activity/data/models/activity_model.dart';
import 'package:crypto_trade/features/activity/data/repos/activity_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'activity_cubit.freezed.dart';
part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  final ActivityRepo _activityRepo;

  ActivityCubit(this._activityRepo) : super(const ActivityState()) {
    getActivities();
  }

  void log({
    required ActivityType type,
    required String symbol,
    required double amount,
    required double price,
    String? name,
    ActivityStatus status = ActivityStatus.completed,
  }) {
    final model = ActivityHiveModel(
      id: const Uuid().v4(),
      type: type,
      coinSymbol: symbol,
      coinName: name,
      amount: amount,
      priceAtTime: price,
      dateTime: DateTime.now(),
      status: status,
    );

    logActivity(model);
  }

  Future<void> logActivity(ActivityHiveModel activity) async {
    try {
      await _activityRepo.logActivity(activity);
      getActivities();
    } catch (e) {
      emit(
        state.copyWith(
          status: ActivityCubitStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void getActivities() {
    try {
      final activities = _activityRepo.getActivities();
      emit(
        state.copyWith(
          status: ActivityCubitStatus.success,
          activities: activities,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ActivityCubitStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// Clears all logs — called on user logout.
  Future<void> clearAll() async {
    await _activityRepo.clearAll();
    emit(state.copyWith(status: ActivityCubitStatus.success, activities: []));
  }
}
