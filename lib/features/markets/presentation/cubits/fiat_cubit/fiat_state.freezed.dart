// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fiat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FiatState {
  FiatStatus get fiatStatus => throw _privateConstructorUsedError;
  double get fiatDepositAmount => throw _privateConstructorUsedError;
  int get selectedPaymentMethodIndex => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of FiatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FiatStateCopyWith<FiatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiatStateCopyWith<$Res> {
  factory $FiatStateCopyWith(FiatState value, $Res Function(FiatState) then) =
      _$FiatStateCopyWithImpl<$Res, FiatState>;
  @useResult
  $Res call(
      {FiatStatus fiatStatus,
      double fiatDepositAmount,
      int selectedPaymentMethodIndex,
      String? message});
}

/// @nodoc
class _$FiatStateCopyWithImpl<$Res, $Val extends FiatState>
    implements $FiatStateCopyWith<$Res> {
  _$FiatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FiatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fiatStatus = null,
    Object? fiatDepositAmount = null,
    Object? selectedPaymentMethodIndex = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      fiatStatus: null == fiatStatus
          ? _value.fiatStatus
          : fiatStatus // ignore: cast_nullable_to_non_nullable
              as FiatStatus,
      fiatDepositAmount: null == fiatDepositAmount
          ? _value.fiatDepositAmount
          : fiatDepositAmount // ignore: cast_nullable_to_non_nullable
              as double,
      selectedPaymentMethodIndex: null == selectedPaymentMethodIndex
          ? _value.selectedPaymentMethodIndex
          : selectedPaymentMethodIndex // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FiatStateImplCopyWith<$Res>
    implements $FiatStateCopyWith<$Res> {
  factory _$$FiatStateImplCopyWith(
          _$FiatStateImpl value, $Res Function(_$FiatStateImpl) then) =
      __$$FiatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FiatStatus fiatStatus,
      double fiatDepositAmount,
      int selectedPaymentMethodIndex,
      String? message});
}

/// @nodoc
class __$$FiatStateImplCopyWithImpl<$Res>
    extends _$FiatStateCopyWithImpl<$Res, _$FiatStateImpl>
    implements _$$FiatStateImplCopyWith<$Res> {
  __$$FiatStateImplCopyWithImpl(
      _$FiatStateImpl _value, $Res Function(_$FiatStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FiatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fiatStatus = null,
    Object? fiatDepositAmount = null,
    Object? selectedPaymentMethodIndex = null,
    Object? message = freezed,
  }) {
    return _then(_$FiatStateImpl(
      fiatStatus: null == fiatStatus
          ? _value.fiatStatus
          : fiatStatus // ignore: cast_nullable_to_non_nullable
              as FiatStatus,
      fiatDepositAmount: null == fiatDepositAmount
          ? _value.fiatDepositAmount
          : fiatDepositAmount // ignore: cast_nullable_to_non_nullable
              as double,
      selectedPaymentMethodIndex: null == selectedPaymentMethodIndex
          ? _value.selectedPaymentMethodIndex
          : selectedPaymentMethodIndex // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FiatStateImpl implements _FiatState {
  const _$FiatStateImpl(
      {this.fiatStatus = FiatStatus.initial,
      this.fiatDepositAmount = 0.0,
      this.selectedPaymentMethodIndex = 0,
      this.message});

  @override
  @JsonKey()
  final FiatStatus fiatStatus;
  @override
  @JsonKey()
  final double fiatDepositAmount;
  @override
  @JsonKey()
  final int selectedPaymentMethodIndex;
  @override
  final String? message;

  @override
  String toString() {
    return 'FiatState(fiatStatus: $fiatStatus, fiatDepositAmount: $fiatDepositAmount, selectedPaymentMethodIndex: $selectedPaymentMethodIndex, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiatStateImpl &&
            (identical(other.fiatStatus, fiatStatus) ||
                other.fiatStatus == fiatStatus) &&
            (identical(other.fiatDepositAmount, fiatDepositAmount) ||
                other.fiatDepositAmount == fiatDepositAmount) &&
            (identical(other.selectedPaymentMethodIndex,
                    selectedPaymentMethodIndex) ||
                other.selectedPaymentMethodIndex ==
                    selectedPaymentMethodIndex) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fiatStatus, fiatDepositAmount,
      selectedPaymentMethodIndex, message);

  /// Create a copy of FiatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FiatStateImplCopyWith<_$FiatStateImpl> get copyWith =>
      __$$FiatStateImplCopyWithImpl<_$FiatStateImpl>(this, _$identity);
}

abstract class _FiatState implements FiatState {
  const factory _FiatState(
      {final FiatStatus fiatStatus,
      final double fiatDepositAmount,
      final int selectedPaymentMethodIndex,
      final String? message}) = _$FiatStateImpl;

  @override
  FiatStatus get fiatStatus;
  @override
  double get fiatDepositAmount;
  @override
  int get selectedPaymentMethodIndex;
  @override
  String? get message;

  /// Create a copy of FiatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FiatStateImplCopyWith<_$FiatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
