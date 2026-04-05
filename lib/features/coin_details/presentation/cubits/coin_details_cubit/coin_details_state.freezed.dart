// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CoinDetailsState {
  CoinDetailsStatus get status => throw _privateConstructorUsedError;
  CoinDetailResponseModel? get coinDetails =>
      throw _privateConstructorUsedError;
  MarketChartResponseModel? get chartData => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CoinDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinDetailsStateCopyWith<CoinDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinDetailsStateCopyWith<$Res> {
  factory $CoinDetailsStateCopyWith(
    CoinDetailsState value,
    $Res Function(CoinDetailsState) then,
  ) = _$CoinDetailsStateCopyWithImpl<$Res, CoinDetailsState>;
  @useResult
  $Res call({
    CoinDetailsStatus status,
    CoinDetailResponseModel? coinDetails,
    MarketChartResponseModel? chartData,
    String? errorMessage,
  });
}

/// @nodoc
class _$CoinDetailsStateCopyWithImpl<$Res, $Val extends CoinDetailsState>
    implements $CoinDetailsStateCopyWith<$Res> {
  _$CoinDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? coinDetails = freezed,
    Object? chartData = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as CoinDetailsStatus,
            coinDetails: freezed == coinDetails
                ? _value.coinDetails
                : coinDetails // ignore: cast_nullable_to_non_nullable
                      as CoinDetailResponseModel?,
            chartData: freezed == chartData
                ? _value.chartData
                : chartData // ignore: cast_nullable_to_non_nullable
                      as MarketChartResponseModel?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CoinDetailsStateImplCopyWith<$Res>
    implements $CoinDetailsStateCopyWith<$Res> {
  factory _$$CoinDetailsStateImplCopyWith(
    _$CoinDetailsStateImpl value,
    $Res Function(_$CoinDetailsStateImpl) then,
  ) = __$$CoinDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CoinDetailsStatus status,
    CoinDetailResponseModel? coinDetails,
    MarketChartResponseModel? chartData,
    String? errorMessage,
  });
}

/// @nodoc
class __$$CoinDetailsStateImplCopyWithImpl<$Res>
    extends _$CoinDetailsStateCopyWithImpl<$Res, _$CoinDetailsStateImpl>
    implements _$$CoinDetailsStateImplCopyWith<$Res> {
  __$$CoinDetailsStateImplCopyWithImpl(
    _$CoinDetailsStateImpl _value,
    $Res Function(_$CoinDetailsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoinDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? coinDetails = freezed,
    Object? chartData = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$CoinDetailsStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CoinDetailsStatus,
        coinDetails: freezed == coinDetails
            ? _value.coinDetails
            : coinDetails // ignore: cast_nullable_to_non_nullable
                  as CoinDetailResponseModel?,
        chartData: freezed == chartData
            ? _value.chartData
            : chartData // ignore: cast_nullable_to_non_nullable
                  as MarketChartResponseModel?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CoinDetailsStateImpl implements _CoinDetailsState {
  const _$CoinDetailsStateImpl({
    this.status = CoinDetailsStatus.initial,
    this.coinDetails,
    this.chartData,
    this.errorMessage,
  });

  @override
  @JsonKey()
  final CoinDetailsStatus status;
  @override
  final CoinDetailResponseModel? coinDetails;
  @override
  final MarketChartResponseModel? chartData;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CoinDetailsState(status: $status, coinDetails: $coinDetails, chartData: $chartData, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinDetailsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.coinDetails, coinDetails) ||
                other.coinDetails == coinDetails) &&
            (identical(other.chartData, chartData) ||
                other.chartData == chartData) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, coinDetails, chartData, errorMessage);

  /// Create a copy of CoinDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinDetailsStateImplCopyWith<_$CoinDetailsStateImpl> get copyWith =>
      __$$CoinDetailsStateImplCopyWithImpl<_$CoinDetailsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CoinDetailsState implements CoinDetailsState {
  const factory _CoinDetailsState({
    final CoinDetailsStatus status,
    final CoinDetailResponseModel? coinDetails,
    final MarketChartResponseModel? chartData,
    final String? errorMessage,
  }) = _$CoinDetailsStateImpl;

  @override
  CoinDetailsStatus get status;
  @override
  CoinDetailResponseModel? get coinDetails;
  @override
  MarketChartResponseModel? get chartData;
  @override
  String? get errorMessage;

  /// Create a copy of CoinDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinDetailsStateImplCopyWith<_$CoinDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
