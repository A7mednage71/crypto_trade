// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'markets_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MarketsState {
  MarketsStatus get status => throw _privateConstructorUsedError;
  List<CoinResponseModel> get coins => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get errorMessage =>
      throw _privateConstructorUsedError; // convert fields
  CoinResponseModel? get fromCoin => throw _privateConstructorUsedError;
  CoinResponseModel? get toCoin => throw _privateConstructorUsedError;
  double get fromAmount => throw _privateConstructorUsedError;
  double get toAmount => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError; // margin fields
  double get leverage => throw _privateConstructorUsedError;
  CoinResponseModel? get selectedMarginCoin =>
      throw _privateConstructorUsedError;
  MarginMode get marginMode => throw _privateConstructorUsedError;
  double get amountToTrade => throw _privateConstructorUsedError;
  double get maxBuy => throw _privateConstructorUsedError;
  double get liquidationPrice => throw _privateConstructorUsedError;
  double get riskPercentage => throw _privateConstructorUsedError;
  RiskLevel get riskLevel => throw _privateConstructorUsedError;
  double get availableBalance => throw _privateConstructorUsedError;
  double get actualOrderAmount => throw _privateConstructorUsedError;
  double get totalOrderValueUSD => throw _privateConstructorUsedError;

  /// Create a copy of MarketsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketsStateCopyWith<MarketsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketsStateCopyWith<$Res> {
  factory $MarketsStateCopyWith(
    MarketsState value,
    $Res Function(MarketsState) then,
  ) = _$MarketsStateCopyWithImpl<$Res, MarketsState>;
  @useResult
  $Res call({
    MarketsStatus status,
    List<CoinResponseModel> coins,
    int currentPage,
    bool isLoadingMore,
    String? errorMessage,
    CoinResponseModel? fromCoin,
    CoinResponseModel? toCoin,
    double fromAmount,
    double toAmount,
    double rate,
    double leverage,
    CoinResponseModel? selectedMarginCoin,
    MarginMode marginMode,
    double amountToTrade,
    double maxBuy,
    double liquidationPrice,
    double riskPercentage,
    RiskLevel riskLevel,
    double availableBalance,
    double actualOrderAmount,
    double totalOrderValueUSD,
  });
}

/// @nodoc
class _$MarketsStateCopyWithImpl<$Res, $Val extends MarketsState>
    implements $MarketsStateCopyWith<$Res> {
  _$MarketsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? coins = null,
    Object? currentPage = null,
    Object? isLoadingMore = null,
    Object? errorMessage = freezed,
    Object? fromCoin = freezed,
    Object? toCoin = freezed,
    Object? fromAmount = null,
    Object? toAmount = null,
    Object? rate = null,
    Object? leverage = null,
    Object? selectedMarginCoin = freezed,
    Object? marginMode = null,
    Object? amountToTrade = null,
    Object? maxBuy = null,
    Object? liquidationPrice = null,
    Object? riskPercentage = null,
    Object? riskLevel = null,
    Object? availableBalance = null,
    Object? actualOrderAmount = null,
    Object? totalOrderValueUSD = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MarketsStatus,
            coins: null == coins
                ? _value.coins
                : coins // ignore: cast_nullable_to_non_nullable
                      as List<CoinResponseModel>,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            availableBalance: null == availableBalance
                ? _value.availableBalance
                : availableBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            actualOrderAmount: null == actualOrderAmount
                ? _value.actualOrderAmount
                : actualOrderAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            totalOrderValueUSD: null == totalOrderValueUSD
                ? _value.totalOrderValueUSD
                : totalOrderValueUSD // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MarketsStateImplCopyWith<$Res>
    implements $MarketsStateCopyWith<$Res> {
  factory _$$MarketsStateImplCopyWith(
    _$MarketsStateImpl value,
    $Res Function(_$MarketsStateImpl) then,
  ) = __$$MarketsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    MarketsStatus status,
    List<CoinResponseModel> coins,
    int currentPage,
    bool isLoadingMore,
    String? errorMessage,
    CoinResponseModel? fromCoin,
    CoinResponseModel? toCoin,
    double fromAmount,
    double toAmount,
    double rate,
    double leverage,
    CoinResponseModel? selectedMarginCoin,
    MarginMode marginMode,
    double amountToTrade,
    double maxBuy,
    double liquidationPrice,
    double riskPercentage,
    RiskLevel riskLevel,
    double availableBalance,
    double actualOrderAmount,
    double totalOrderValueUSD,
  });
}

/// @nodoc
class __$$MarketsStateImplCopyWithImpl<$Res>
    extends _$MarketsStateCopyWithImpl<$Res, _$MarketsStateImpl>
    implements _$$MarketsStateImplCopyWith<$Res> {
  __$$MarketsStateImplCopyWithImpl(
    _$MarketsStateImpl _value,
    $Res Function(_$MarketsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarketsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? coins = null,
    Object? currentPage = null,
    Object? isLoadingMore = null,
    Object? errorMessage = freezed,
    Object? fromCoin = freezed,
    Object? toCoin = freezed,
    Object? fromAmount = null,
    Object? toAmount = null,
    Object? rate = null,
    Object? leverage = null,
    Object? selectedMarginCoin = freezed,
    Object? marginMode = null,
    Object? amountToTrade = null,
    Object? maxBuy = null,
    Object? liquidationPrice = null,
    Object? riskPercentage = null,
    Object? riskLevel = null,
    Object? availableBalance = null,
    Object? actualOrderAmount = null,
    Object? totalOrderValueUSD = null,
  }) {
    return _then(
      _$MarketsStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MarketsStatus,
        coins: null == coins
            ? _value._coins
            : coins // ignore: cast_nullable_to_non_nullable
                  as List<CoinResponseModel>,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        availableBalance: null == availableBalance
            ? _value.availableBalance
            : availableBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        actualOrderAmount: null == actualOrderAmount
            ? _value.actualOrderAmount
            : actualOrderAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        totalOrderValueUSD: null == totalOrderValueUSD
            ? _value.totalOrderValueUSD
            : totalOrderValueUSD // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$MarketsStateImpl implements _MarketsState {
  const _$MarketsStateImpl({
    this.status = MarketsStatus.initial,
    final List<CoinResponseModel> coins = const [],
    this.currentPage = 1,
    this.isLoadingMore = false,
    this.errorMessage,
    this.fromCoin,
    this.toCoin,
    this.fromAmount = 0.0,
    this.toAmount = 0.0,
    this.rate = 0.0,
    this.leverage = 1.0,
    this.selectedMarginCoin,
    this.marginMode = MarginMode.cross,
    this.amountToTrade = 0.0,
    this.maxBuy = 0.0,
    this.liquidationPrice = 0.0,
    this.riskPercentage = 0.0,
    this.riskLevel = RiskLevel.low,
    this.availableBalance = 1234.56,
    this.actualOrderAmount = 0.0,
    this.totalOrderValueUSD = 0.0,
  }) : _coins = coins;

  @override
  @JsonKey()
  final MarketsStatus status;
  final List<CoinResponseModel> _coins;
  @override
  @JsonKey()
  List<CoinResponseModel> get coins {
    if (_coins is EqualUnmodifiableListView) return _coins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coins);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? errorMessage;
  // convert fields
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
  // margin fields
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
  final double availableBalance;
  @override
  @JsonKey()
  final double actualOrderAmount;
  @override
  @JsonKey()
  final double totalOrderValueUSD;

  @override
  String toString() {
    return 'MarketsState(status: $status, coins: $coins, currentPage: $currentPage, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage, fromCoin: $fromCoin, toCoin: $toCoin, fromAmount: $fromAmount, toAmount: $toAmount, rate: $rate, leverage: $leverage, selectedMarginCoin: $selectedMarginCoin, marginMode: $marginMode, amountToTrade: $amountToTrade, maxBuy: $maxBuy, liquidationPrice: $liquidationPrice, riskPercentage: $riskPercentage, riskLevel: $riskLevel, availableBalance: $availableBalance, actualOrderAmount: $actualOrderAmount, totalOrderValueUSD: $totalOrderValueUSD)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._coins, _coins) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.fromCoin, fromCoin) ||
                other.fromCoin == fromCoin) &&
            (identical(other.toCoin, toCoin) || other.toCoin == toCoin) &&
            (identical(other.fromAmount, fromAmount) ||
                other.fromAmount == fromAmount) &&
            (identical(other.toAmount, toAmount) ||
                other.toAmount == toAmount) &&
            (identical(other.rate, rate) || other.rate == rate) &&
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
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.actualOrderAmount, actualOrderAmount) ||
                other.actualOrderAmount == actualOrderAmount) &&
            (identical(other.totalOrderValueUSD, totalOrderValueUSD) ||
                other.totalOrderValueUSD == totalOrderValueUSD));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_coins),
    currentPage,
    isLoadingMore,
    errorMessage,
    fromCoin,
    toCoin,
    fromAmount,
    toAmount,
    rate,
    leverage,
    selectedMarginCoin,
    marginMode,
    amountToTrade,
    maxBuy,
    liquidationPrice,
    riskPercentage,
    riskLevel,
    availableBalance,
    actualOrderAmount,
    totalOrderValueUSD,
  ]);

  /// Create a copy of MarketsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketsStateImplCopyWith<_$MarketsStateImpl> get copyWith =>
      __$$MarketsStateImplCopyWithImpl<_$MarketsStateImpl>(this, _$identity);
}

abstract class _MarketsState implements MarketsState {
  const factory _MarketsState({
    final MarketsStatus status,
    final List<CoinResponseModel> coins,
    final int currentPage,
    final bool isLoadingMore,
    final String? errorMessage,
    final CoinResponseModel? fromCoin,
    final CoinResponseModel? toCoin,
    final double fromAmount,
    final double toAmount,
    final double rate,
    final double leverage,
    final CoinResponseModel? selectedMarginCoin,
    final MarginMode marginMode,
    final double amountToTrade,
    final double maxBuy,
    final double liquidationPrice,
    final double riskPercentage,
    final RiskLevel riskLevel,
    final double availableBalance,
    final double actualOrderAmount,
    final double totalOrderValueUSD,
  }) = _$MarketsStateImpl;

  @override
  MarketsStatus get status;
  @override
  List<CoinResponseModel> get coins;
  @override
  int get currentPage;
  @override
  bool get isLoadingMore;
  @override
  String? get errorMessage; // convert fields
  @override
  CoinResponseModel? get fromCoin;
  @override
  CoinResponseModel? get toCoin;
  @override
  double get fromAmount;
  @override
  double get toAmount;
  @override
  double get rate; // margin fields
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
  double get availableBalance;
  @override
  double get actualOrderAmount;
  @override
  double get totalOrderValueUSD;

  /// Create a copy of MarketsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketsStateImplCopyWith<_$MarketsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
