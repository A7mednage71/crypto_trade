// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityHiveModelAdapter extends TypeAdapter<ActivityHiveModel> {
  @override
  final int typeId = 1;

  @override
  ActivityHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityHiveModel(
      id: fields[0] as String,
      type: fields[1] as ActivityType,
      coinSymbol: fields[2] as String,
      coinName: fields[3] as String?,
      amount: fields[4] as double,
      priceAtTime: fields[5] as double?,
      dateTime: fields[6] as DateTime,
      status: fields[7] as ActivityStatus,
    );
  }

  @override
  void write(BinaryWriter writer, ActivityHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.coinSymbol)
      ..writeByte(3)
      ..write(obj.coinName)
      ..writeByte(4)
      ..write(obj.amount)
      ..writeByte(5)
      ..write(obj.priceAtTime)
      ..writeByte(6)
      ..write(obj.dateTime)
      ..writeByte(7)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ActivityTypeAdapter extends TypeAdapter<ActivityType> {
  @override
  final int typeId = 2;

  @override
  ActivityType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ActivityType.buy;
      case 1:
        return ActivityType.sell;
      case 2:
        return ActivityType.deposit;
      case 3:
        return ActivityType.withdraw;
      case 4:
        return ActivityType.swap;
      default:
        return ActivityType.buy;
    }
  }

  @override
  void write(BinaryWriter writer, ActivityType obj) {
    switch (obj) {
      case ActivityType.buy:
        writer.writeByte(0);
        break;
      case ActivityType.sell:
        writer.writeByte(1);
        break;
      case ActivityType.deposit:
        writer.writeByte(2);
        break;
      case ActivityType.withdraw:
        writer.writeByte(3);
        break;
      case ActivityType.swap:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ActivityStatusAdapter extends TypeAdapter<ActivityStatus> {
  @override
  final int typeId = 3;

  @override
  ActivityStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ActivityStatus.completed;
      case 1:
        return ActivityStatus.failed;
      case 2:
        return ActivityStatus.cancelled;
      case 3:
        return ActivityStatus.pending;
      default:
        return ActivityStatus.completed;
    }
  }

  @override
  void write(BinaryWriter writer, ActivityStatus obj) {
    switch (obj) {
      case ActivityStatus.completed:
        writer.writeByte(0);
        break;
      case ActivityStatus.failed:
        writer.writeByte(1);
        break;
      case ActivityStatus.cancelled:
        writer.writeByte(2);
        break;
      case ActivityStatus.pending:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
