// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'margin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MarginState {
  TradeStatus get tradeStatus => throw _privateConstructorUsedError;
  String? get tradeErrorMessage => throw _privateConstructorUsedError;
  double get leverage => throw _privateConstructorUsedError;
  CoinResponseModel? get selectedMarginCoin =>
      throw _privateConstructorUsedError;
  MarginMode get marginMode => throw _privateConstructorUsedError;
  double get amountToTrade => throw _privateConstructorUsedError;
  double get maxBuy => throw _privateConstructorUsedError;
  double get liquidationPrice => throw _privateConstructorUsedError;
  double get riskPercentage => throw _privateConstructorUsedError;
  RiskLevel get riskLevel => throw _privateConstructorUsedError;
  double get actualOrderAmount => throw _privateConstructorUsedError;
  double get totalOrderValueUSD => throw _privateConstructorUsedError;
  double get availableBalance => throw _privateConstructorUsedError;

  /// Create a copy of MarginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarginStateCopyWith<MarginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarginStateCopyWith<$Res> {
  factory $MarginStateCopyWith(
          MarginState value, $Res Function(MarginState) then) =
      _$MarginStateCopyWithImpl<$Res, MarginState>;
  @useResult
  $Res call(
      {TradeStatus tradeStatus,
      String? tradeErrorMessage,
      double leverage,
      CoinResponseModel? selectedMarginCoin,
      MarginMode marginMode,
      double amountToTrade,
      double maxBuy,
      double liquidationPrice,
      double riskPercentage,
      RiskLevel riskLevel,
      double actualOrderAmount,
      double totalOrderValueUSD,
      double availableBalance});
}

/// @nodoc
class _$MarginStateCopyWithImpl<$Res, $Val extends MarginState>
    implements $MarginStateCopyWith<$Res> {
  _$MarginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradeStatus = null,
    Object? tradeErrorMessage = freezed,
    Object? leverage = null,
    Object? selectedMarginCoin = freezed,
    Object? marginMode = null,
    Object? amountToTrade = null,
    Object? maxBuy = null,
    Object? liquidationPrice = null,
    Object? riskPercentage = null,
    Object? riskLevel = null,
    Object? actualOrderAmount = null,
    Object? totalOrderValueUSD = null,
    Object? availableBalance = null,
  }) {
    return _then(_value.copyWith(
      tradeStatus: null == tradeStatus
          ? _value.tradeStatus
          : tradeStatus // ignore: cast_nullable_to_non_nullable
              as TradeStatus,
      tradeErrorMessage: freezed == tradeErrorMessage
          ? _value.tradeErrorMessage
          : tradeErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      leverage: null == leverage
          ? _value.leverage
          : leverage // ignore: cast_nullable_to_non_nullable
              as double,
      selectedMarginCoin: freezed == selectedMarginCoin
          ? _value.selectedMarginCoin
          : selectedMarginCoin // ignore: cast_nullable_to_non_nullable
              as CoinResponseModel?,
      marginMode: null == marginMode
          ? _value.marginMode
          : marginMode // ignore: cast_nullable_to_non_nullable
              as MarginMode,
      amountToTrade: null == amountToTrade
          ? _value.amountToTrade
          : amountToTrade // ignore: cast_nullable_to_non_nullable
              as double,
      maxBuy: null == maxBuy
          ? _value.maxBuy
          : maxBuy // ignore: cast_nullable_to_non_nullable
              as double,
      liquidationPrice: null == liquidationPrice
          ? _value.liquidationPrice
          : liquidationPrice // ignore: cast_nullable_to_non_nullable
              as double,
      riskPercentage: null == riskPercentage
          ? _value.riskPercentage
          : riskPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      actualOrderAmount: null == actualOrderAmount
          ? _value.actualOrderAmount
          : actualOrderAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalOrderValueUSD: null == totalOrderValueUSD
          ? _value.totalOrderValueUSD
          : totalOrderValueUSD // ignore: cast_nullable_to_non_nullable
              as double,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarginStateImplCopyWith<$Res>
    implements $MarginStateCopyWith<$Res> {
  factory _$$MarginStateImplCopyWith(
          _$MarginStateImpl value, $Res Function(_$MarginStateImpl) then) =
      __$$MarginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TradeStatus tradeStatus,
      String? tradeErrorMessage,
      double leverage,
      CoinResponseModel? selectedMarginCoin,
      MarginMode marginMode,
      double amountToTrade,
      double maxBuy,
      double liquidationPrice,
      double riskPercentage,
      RiskLevel riskLevel,
      double actualOrderAmount,
      double totalOrderValueUSD,
      double availableBalance});
}

/// @nodoc
class __$$MarginStateImplCopyWithImpl<$Res>
    extends _$MarginStateCopyWithImpl<$Res, _$MarginStateImpl>
    implements _$$MarginStateImplCopyWith<$Res> {
  __$$MarginStateImplCopyWithImpl(
      _$MarginStateImpl _value, $Res Function(_$MarginStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradeStatus = null,
    Object? tradeErrorMessage = freezed,
    Object? leverage = null,
    Object? selectedMarginCoin = freezed,
    Object? marginMode = null,
    Object? amountToTrade = null,
    Object? maxBuy = null,
    Object? liquidationPrice = null,
    Object? riskPercentage = null,
    Object? riskLevel = null,
    Object? actualOrderAmount = null,
    Object? totalOrderValueUSD = null,
    Object? availableBalance = null,
  }) {
    return _then(_$MarginStateImpl(
      tradeStatus: null == tradeStatus
          ? _value.tradeStatus
          : tradeStatus // ignore: cast_nullable_to_non_nullable
              as TradeStatus,
      tradeErrorMessage: freezed == tradeErrorMessage
          ? _value.tradeErrorMessage
          : tradeErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      leverage: null == leverage
          ? _value.leverage
          : leverage // ignore: cast_nullable_to_non_nullable
              as double,
      selectedMarginCoin: freezed == selectedMarginCoin
          ? _value.selectedMarginCoin
          : selectedMarginCoin // ignore: cast_nullable_to_non_nullable
              as CoinResponseModel?,
      marginMode: null == marginMode
          ? _value.marginMode
          : marginMode // ignore: cast_nullable_to_non_nullable
              as MarginMode,
      amountToTrade: null == amountToTrade
          ? _value.amountToTrade
          : amountToTrade // ignore: cast_nullable_to_non_nullable
              as double,
      maxBuy: null == maxBuy
          ? _value.maxBuy
          : maxBuy // ignore: cast_nullable_to_non_nullable
              as double,
      liquidationPrice: null == liquidationPrice
          ? _value.liquidationPrice
          : liquidationPrice // ignore: cast_nullable_to_non_nullable
              as double,
      riskPercentage: null == riskPercentage
          ? _value.riskPercentage
          : riskPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      actualOrderAmount: null == actualOrderAmount
          ? _value.actualOrderAmount
          : actualOrderAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalOrderValueUSD: null == totalOrderValueUSD
          ? _value.totalOrderValueUSD
          : totalOrderValueUSD // ignore: cast_nullable_to_non_nullable
              as double,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MarginStateImpl implements _MarginState {
  const _$MarginStateImpl(
      {this.tradeStatus = TradeStatus.initial,
      this.tradeErrorMessage,
      this.leverage = 1.0,
      this.selectedMarginCoin,
      this.marginMode = MarginMode.cross,
      this.amountToTrade = 0.0,
      this.maxBuy = 0.0,
      this.liquidationPrice = 0.0,
      this.riskPercentage = 0.0,
      this.riskLevel = RiskLevel.low,
      this.actualOrderAmount = 0.0,
      this.totalOrderValueUSD = 0.0,
      this.availableBalance = 1234.56});

  @override
  @JsonKey()
  final TradeStatus tradeStatus;
  @override
  final String? tradeErrorMessage;
  @override
  @JsonKey()
  final double leverage;
  @override
  final CoinResponseModel? selectedMarginCoin;
  @override
  @JsonKey()
  final MarginMode marginMode;
  @override
  @JsonKey()
  final double amountToTrade;
  @override
  @JsonKey()
  final double maxBuy;
  @override
  @JsonKey()
  final double liquidationPrice;
  @override
  @JsonKey()
  final double riskPercentage;
  @override
  @JsonKey()
  final RiskLevel riskLevel;
  @override
  @JsonKey()
  final double actualOrderAmount;
  @override
  @JsonKey()
  final double totalOrderValueUSD;
  @override
  @JsonKey()
  final double availableBalance;

  @override
  String toString() {
    return 'MarginState(tradeStatus: $tradeStatus, tradeErrorMessage: $tradeErrorMessage, leverage: $leverage, selectedMarginCoin: $selectedMarginCoin, marginMode: $marginMode, amountToTrade: $amountToTrade, maxBuy: $maxBuy, liquidationPrice: $liquidationPrice, riskPercentage: $riskPercentage, riskLevel: $riskLevel, actualOrderAmount: $actualOrderAmount, totalOrderValueUSD: $totalOrderValueUSD, availableBalance: $availableBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarginStateImpl &&
            (identical(other.tradeStatus, tradeStatus) ||
                other.tradeStatus == tradeStatus) &&
            (identical(other.tradeErrorMessage, tradeErrorMessage) ||
                other.tradeErrorMessage == tradeErrorMessage) &&
            (identical(other.leverage, leverage) ||
                other.leverage == leverage) &&
            (identical(other.selectedMarginCoin, selectedMarginCoin) ||
                other.selectedMarginCoin == selectedMarginCoin) &&
            (identical(other.marginMode, marginMode) ||
                other.marginMode == marginMode) &&
            (identical(other.amountToTrade, amountToTrade) ||
                other.amountToTrade == amountToTrade) &&
            (identical(other.maxBuy, maxBuy) || other.maxBuy == maxBuy) &&
            (identical(other.liquidationPrice, liquidationPrice) ||
                other.liquidationPrice == liquidationPrice) &&
            (identical(other.riskPercentage, riskPercentage) ||
                other.riskPercentage == riskPercentage) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.actualOrderAmount, actualOrderAmount) ||
                other.actualOrderAmount == actualOrderAmount) &&
            (identical(other.totalOrderValueUSD, totalOrderValueUSD) ||
                other.totalOrderValueUSD == totalOrderValueUSD) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      tradeStatus,
      tradeErrorMessage,
      leverage,
      selectedMarginCoin,
      marginMode,
      amountToTrade,
      maxBuy,
      liquidationPrice,
      riskPercentage,
      riskLevel,
      actualOrderAmount,
      totalOrderValueUSD,
      availableBalance);

  /// Create a copy of MarginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarginStateImplCopyWith<_$MarginStateImpl> get copyWith =>
      __$$MarginStateImplCopyWithImpl<_$MarginStateImpl>(this, _$identity);
}

abstract class _MarginState implements MarginState {
  const factory _MarginState(
      {final TradeStatus tradeStatus,
      final String? tradeErrorMessage,
      final double leverage,
      final CoinResponseModel? selectedMarginCoin,
      final MarginMode marginMode,
      final double amountToTrade,
      final double maxBuy,
      final double liquidationPrice,
      final double riskPercentage,
      final RiskLevel riskLevel,
      final double actualOrderAmount,
      final double totalOrderValueUSD,
      final double availableBalance}) = _$MarginStateImpl;

  @override
  TradeStatus get tradeStatus;
  @override
  String? get tradeErrorMessage;
  @override
  double get leverage;
  @override
  CoinResponseModel? get selectedMarginCoin;
  @override
  MarginMode get marginMode;
  @override
  double get amountToTrade;
  @override
  double get maxBuy;
  @override
  double get liquidationPrice;
  @override
  double get riskPercentage;
  @override
  RiskLevel get riskLevel;
  @override
  double get actualOrderAmount;
  @override
  double get totalOrderValueUSD;
  @override
  double get availableBalance;

  /// Create a copy of MarginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarginStateImplCopyWith<_$MarginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
