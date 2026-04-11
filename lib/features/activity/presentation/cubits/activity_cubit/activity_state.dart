part of 'activity_cubit.dart';

enum ActivityCubitStatus { initial, loading, success, failure }

@freezed
class ActivityState with _$ActivityState {
  const factory ActivityState({
    @Default(ActivityCubitStatus.initial) ActivityCubitStatus status,
    @Default([]) List<ActivityHiveModel> activities,
    String? errorMessage,
  }) = _ActivityState;
}
