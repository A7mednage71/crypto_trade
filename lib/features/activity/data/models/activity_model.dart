import 'package:hive/hive.dart';

part 'activity_model.g.dart';

@HiveType(typeId: 2)
enum ActivityType {
  @HiveField(0)
  buy,

  @HiveField(1)
  sell,

  @HiveField(2)
  deposit,

  @HiveField(3)
  withdraw,

  @HiveField(4)
  swap,
}

@HiveType(typeId: 3)
enum ActivityStatus {
  @HiveField(0)
  completed,

  @HiveField(1)
  failed,

  @HiveField(2)
  cancelled,

  @HiveField(3)
  pending,
}

@HiveType(typeId: 1)
class ActivityHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final ActivityType type;

  @HiveField(2)
  final String coinSymbol;

  @HiveField(3)
  final String? coinName;

  @HiveField(4)
  final double amount;

  @HiveField(5)
  final double? priceAtTime;

  @HiveField(6)
  final DateTime dateTime;

  @HiveField(7)
  final ActivityStatus status;

  ActivityHiveModel({
    required this.id,
    required this.type,
    required this.coinSymbol,
    this.coinName,
    required this.amount,
    this.priceAtTime,
    required this.dateTime,
    required this.status,
  });

  String get typeLabel {
    return switch (type) {
      ActivityType.buy => 'Buy',
      ActivityType.sell => 'Sell',
      ActivityType.deposit => 'Deposit',
      ActivityType.withdraw => 'Withdraw',
      ActivityType.swap => 'Swap',
    };
  }

  String get statusLabel {
    return switch (status) {
      ActivityStatus.completed => 'Completed',
      ActivityStatus.failed => 'Failed',
      ActivityStatus.cancelled => 'Cancelled',
      ActivityStatus.pending => 'Pending',
    };
  }

  bool get isSuccess => status == ActivityStatus.completed;
}
