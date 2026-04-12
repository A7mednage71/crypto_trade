// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'convert_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConvertState {
  ConvertStatus get convertStatus => throw _privateConstructorUsedError;
  CoinResponseModel? get fromCoin => throw _privateConstructorUsedError;
  CoinResponseModel? get toCoin => throw _privateConstructorUsedError;
  double get fromAmount => throw _privateConstructorUsedError;
  double get toAmount => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of ConvertState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConvertStateCopyWith<ConvertState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConvertStateCopyWith<$Res> {
  factory $ConvertStateCopyWith(
          ConvertState value, $Res Function(ConvertState) then) =
      _$ConvertStateCopyWithImpl<$Res, ConvertState>;
  @useResult
  $Res call(
      {ConvertStatus convertStatus,
      CoinResponseModel? fromCoin,
      CoinResponseModel? toCoin,
      double fromAmount,
      double toAmount,
      double rate,
      String? message});
}

/// @nodoc
class _$ConvertStateCopyWithImpl<$Res, $Val extends ConvertState>
    implements $ConvertStateCopyWith<$Res> {
  _$ConvertStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConvertState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? convertStatus = null,
    Object? fromCoin = freezed,
    Object? toCoin = freezed,
    Object? fromAmount = null,
    Object? toAmount = null,
    Object? rate = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      convertStatus: null == convertStatus
          ? _value.convertStatus
          : convertStatus // ignore: cast_nullable_to_non_nullable
              as ConvertStatus,
      fromCoin: freezed == fromCoin
          ? _value.fromCoin
          : fromCoin // ignore: cast_nullable_to_non_nullable
              as CoinResponseModel?,
      toCoin: freezed == toCoin
          ? _value.toCoin
          : toCoin // ignore: cast_nullable_to_non_nullable
              as CoinResponseModel?,
      fromAmount: null == fromAmount
          ? _value.fromAmount
          : fromAmount // ignore: cast_nullable_to_non_nullable
              as double,
      toAmount: null == toAmount
          ? _value.toAmount
          : toAmount // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConvertStateImplCopyWith<$Res>
    implements $ConvertStateCopyWith<$Res> {
  factory _$$ConvertStateImplCopyWith(
          _$ConvertStateImpl value, $Res Function(_$ConvertStateImpl) then) =
      __$$ConvertStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ConvertStatus convertStatus,
      CoinResponseModel? fromCoin,
      CoinResponseModel? toCoin,
      double fromAmount,
      double toAmount,
      double rate,
      String? message});
}

/// @nodoc
class __$$ConvertStateImplCopyWithImpl<$Res>
    extends _$ConvertStateCopyWithImpl<$Res, _$ConvertStateImpl>
    implements _$$ConvertStateImplCopyWith<$Res> {
  __$$ConvertStateImplCopyWithImpl(
      _$ConvertStateImpl _value, $Res Function(_$ConvertStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConvertState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? convertStatus = null,
    Object? fromCoin = freezed,
    Object? toCoin = freezed,
    Object? fromAmount = null,
    Object? toAmount = null,
    Object? rate = null,
    Object? message = freezed,
  }) {
    return _then(_$ConvertStateImpl(
      convertStatus: null == convertStatus
          ? _value.convertStatus
          : convertStatus // ignore: cast_nullable_to_non_nullable
              as ConvertStatus,
      fromCoin: freezed == fromCoin
          ? _value.fromCoin
          : fromCoin // ignore: cast_nullable_to_non_nullable
              as CoinResponseModel?,
      toCoin: freezed == toCoin
          ? _value.toCoin
          : toCoin // ignore: cast_nullable_to_non_nullable
              as CoinResponseModel?,
      fromAmount: null == fromAmount
          ? _value.fromAmount
          : fromAmount // ignore: cast_nullable_to_non_nullable
              as double,
      toAmount: null == toAmount
          ? _value.toAmount
          : toAmount // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConvertStateImpl implements _ConvertState {
  const _$ConvertStateImpl(
      {this.convertStatus = ConvertStatus.initial,
      this.fromCoin,
      this.toCoin,
      this.fromAmount = 0.0,
      this.toAmount = 0.0,
      this.rate = 0.0,
      this.message});

  @override
  @JsonKey()
  final ConvertStatus convertStatus;
  @override
  final CoinResponseModel? fromCoin;
  @override
  final CoinResponseModel? toCoin;
  @override
  @JsonKey()
  final double fromAmount;
  @override
  @JsonKey()
  final double toAmount;
  @override
  @JsonKey()
  final double rate;
  @override
  final String? message;

  @override
  String toString() {
    return 'ConvertState(convertStatus: $convertStatus, fromCoin: $fromCoin, toCoin: $toCoin, fromAmount: $fromAmount, toAmount: $toAmount, rate: $rate, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConvertStateImpl &&
            (identical(other.convertStatus, convertStatus) ||
                other.convertStatus == convertStatus) &&
            (identical(other.fromCoin, fromCoin) ||
                other.fromCoin == fromCoin) &&
            (identical(other.toCoin, toCoin) || other.toCoin == toCoin) &&
            (identical(other.fromAmount, fromAmount) ||
                other.fromAmount == fromAmount) &&
            (identical(other.toAmount, toAmount) ||
                other.toAmount == toAmount) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, convertStatus, fromCoin, toCoin,
      fromAmount, toAmount, rate, message);

  /// Create a copy of ConvertState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvertStateImplCopyWith<_$ConvertStateImpl> get copyWith =>
      __$$ConvertStateImplCopyWithImpl<_$ConvertStateImpl>(this, _$identity);
}

abstract class _ConvertState implements ConvertState {
  const factory _ConvertState(
      {final ConvertStatus convertStatus,
      final CoinResponseModel? fromCoin,
      final CoinResponseModel? toCoin,
      final double fromAmount,
      final double toAmount,
      final double rate,
      final String? message}) = _$ConvertStateImpl;

  @override
  ConvertStatus get convertStatus;
  @override
  CoinResponseModel? get fromCoin;
  @override
  CoinResponseModel? get toCoin;
  @override
  double get fromAmount;
  @override
  double get toAmount;
  @override
  double get rate;
  @override
  String? get message;

  /// Create a copy of ConvertState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConvertStateImplCopyWith<_$ConvertStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
