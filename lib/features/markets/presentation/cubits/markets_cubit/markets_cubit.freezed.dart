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
  int get totalPages => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

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
    int totalPages,
    bool isLoadingMore,
    String? errorMessage,
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
    Object? totalPages = null,
    Object? isLoadingMore = null,
    Object? errorMessage = freezed,
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
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
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
    int totalPages,
    bool isLoadingMore,
    String? errorMessage,
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
    Object? totalPages = null,
    Object? isLoadingMore = null,
    Object? errorMessage = freezed,
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
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
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
    this.totalPages = 1,
    this.isLoadingMore = false,
    this.errorMessage,
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
  final int totalPages;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MarketsState(status: $status, coins: $coins, currentPage: $currentPage, totalPages: $totalPages, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
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
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_coins),
    currentPage,
    totalPages,
    isLoadingMore,
    errorMessage,
  );

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
    final int totalPages,
    final bool isLoadingMore,
    final String? errorMessage,
  }) = _$MarketsStateImpl;

  @override
  MarketsStatus get status;
  @override
  List<CoinResponseModel> get coins;
  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  bool get isLoadingMore;
  @override
  String? get errorMessage;

  /// Create a copy of MarketsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketsStateImplCopyWith<_$MarketsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
