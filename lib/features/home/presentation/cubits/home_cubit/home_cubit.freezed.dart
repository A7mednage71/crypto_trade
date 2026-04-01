// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  HomeStatus get topCoinsStatus => throw _privateConstructorUsedError;
  HomeStatus get recentCoinsStatus => throw _privateConstructorUsedError;
  List<CoinResponseModel> get recentCoins => throw _privateConstructorUsedError;
  List<CoinResponseModel> get topCoins => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    HomeStatus topCoinsStatus,
    HomeStatus recentCoinsStatus,
    List<CoinResponseModel> recentCoins,
    List<CoinResponseModel> topCoins,
    String? errorMessage,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topCoinsStatus = null,
    Object? recentCoinsStatus = null,
    Object? recentCoins = null,
    Object? topCoins = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            topCoinsStatus: null == topCoinsStatus
                ? _value.topCoinsStatus
                : topCoinsStatus // ignore: cast_nullable_to_non_nullable
                      as HomeStatus,
            recentCoinsStatus: null == recentCoinsStatus
                ? _value.recentCoinsStatus
                : recentCoinsStatus // ignore: cast_nullable_to_non_nullable
                      as HomeStatus,
            recentCoins: null == recentCoins
                ? _value.recentCoins
                : recentCoins // ignore: cast_nullable_to_non_nullable
                      as List<CoinResponseModel>,
            topCoins: null == topCoins
                ? _value.topCoins
                : topCoins // ignore: cast_nullable_to_non_nullable
                      as List<CoinResponseModel>,
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
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    HomeStatus topCoinsStatus,
    HomeStatus recentCoinsStatus,
    List<CoinResponseModel> recentCoins,
    List<CoinResponseModel> topCoins,
    String? errorMessage,
  });
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topCoinsStatus = null,
    Object? recentCoinsStatus = null,
    Object? recentCoins = null,
    Object? topCoins = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        topCoinsStatus: null == topCoinsStatus
            ? _value.topCoinsStatus
            : topCoinsStatus // ignore: cast_nullable_to_non_nullable
                  as HomeStatus,
        recentCoinsStatus: null == recentCoinsStatus
            ? _value.recentCoinsStatus
            : recentCoinsStatus // ignore: cast_nullable_to_non_nullable
                  as HomeStatus,
        recentCoins: null == recentCoins
            ? _value._recentCoins
            : recentCoins // ignore: cast_nullable_to_non_nullable
                  as List<CoinResponseModel>,
        topCoins: null == topCoins
            ? _value._topCoins
            : topCoins // ignore: cast_nullable_to_non_nullable
                  as List<CoinResponseModel>,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    this.topCoinsStatus = HomeStatus.initial,
    this.recentCoinsStatus = HomeStatus.initial,
    final List<CoinResponseModel> recentCoins = const [],
    final List<CoinResponseModel> topCoins = const [],
    this.errorMessage,
  }) : _recentCoins = recentCoins,
       _topCoins = topCoins;

  @override
  @JsonKey()
  final HomeStatus topCoinsStatus;
  @override
  @JsonKey()
  final HomeStatus recentCoinsStatus;
  final List<CoinResponseModel> _recentCoins;
  @override
  @JsonKey()
  List<CoinResponseModel> get recentCoins {
    if (_recentCoins is EqualUnmodifiableListView) return _recentCoins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentCoins);
  }

  final List<CoinResponseModel> _topCoins;
  @override
  @JsonKey()
  List<CoinResponseModel> get topCoins {
    if (_topCoins is EqualUnmodifiableListView) return _topCoins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topCoins);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HomeState(topCoinsStatus: $topCoinsStatus, recentCoinsStatus: $recentCoinsStatus, recentCoins: $recentCoins, topCoins: $topCoins, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.topCoinsStatus, topCoinsStatus) ||
                other.topCoinsStatus == topCoinsStatus) &&
            (identical(other.recentCoinsStatus, recentCoinsStatus) ||
                other.recentCoinsStatus == recentCoinsStatus) &&
            const DeepCollectionEquality().equals(
              other._recentCoins,
              _recentCoins,
            ) &&
            const DeepCollectionEquality().equals(other._topCoins, _topCoins) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    topCoinsStatus,
    recentCoinsStatus,
    const DeepCollectionEquality().hash(_recentCoins),
    const DeepCollectionEquality().hash(_topCoins),
    errorMessage,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final HomeStatus topCoinsStatus,
    final HomeStatus recentCoinsStatus,
    final List<CoinResponseModel> recentCoins,
    final List<CoinResponseModel> topCoins,
    final String? errorMessage,
  }) = _$HomeStateImpl;

  @override
  HomeStatus get topCoinsStatus;
  @override
  HomeStatus get recentCoinsStatus;
  @override
  List<CoinResponseModel> get recentCoins;
  @override
  List<CoinResponseModel> get topCoins;
  @override
  String? get errorMessage;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
