// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppNavigationState {
  NavItem get selectedBottomNavItem => throw _privateConstructorUsedError;
  MarketTabType get selectedTradesTab => throw _privateConstructorUsedError;

  /// Create a copy of AppNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppNavigationStateCopyWith<AppNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNavigationStateCopyWith<$Res> {
  factory $AppNavigationStateCopyWith(
          AppNavigationState value, $Res Function(AppNavigationState) then) =
      _$AppNavigationStateCopyWithImpl<$Res, AppNavigationState>;
  @useResult
  $Res call({NavItem selectedBottomNavItem, MarketTabType selectedTradesTab});
}

/// @nodoc
class _$AppNavigationStateCopyWithImpl<$Res, $Val extends AppNavigationState>
    implements $AppNavigationStateCopyWith<$Res> {
  _$AppNavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBottomNavItem = null,
    Object? selectedTradesTab = null,
  }) {
    return _then(_value.copyWith(
      selectedBottomNavItem: null == selectedBottomNavItem
          ? _value.selectedBottomNavItem
          : selectedBottomNavItem // ignore: cast_nullable_to_non_nullable
              as NavItem,
      selectedTradesTab: null == selectedTradesTab
          ? _value.selectedTradesTab
          : selectedTradesTab // ignore: cast_nullable_to_non_nullable
              as MarketTabType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppNavigationStateImplCopyWith<$Res>
    implements $AppNavigationStateCopyWith<$Res> {
  factory _$$AppNavigationStateImplCopyWith(_$AppNavigationStateImpl value,
          $Res Function(_$AppNavigationStateImpl) then) =
      __$$AppNavigationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NavItem selectedBottomNavItem, MarketTabType selectedTradesTab});
}

/// @nodoc
class __$$AppNavigationStateImplCopyWithImpl<$Res>
    extends _$AppNavigationStateCopyWithImpl<$Res, _$AppNavigationStateImpl>
    implements _$$AppNavigationStateImplCopyWith<$Res> {
  __$$AppNavigationStateImplCopyWithImpl(_$AppNavigationStateImpl _value,
      $Res Function(_$AppNavigationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBottomNavItem = null,
    Object? selectedTradesTab = null,
  }) {
    return _then(_$AppNavigationStateImpl(
      selectedBottomNavItem: null == selectedBottomNavItem
          ? _value.selectedBottomNavItem
          : selectedBottomNavItem // ignore: cast_nullable_to_non_nullable
              as NavItem,
      selectedTradesTab: null == selectedTradesTab
          ? _value.selectedTradesTab
          : selectedTradesTab // ignore: cast_nullable_to_non_nullable
              as MarketTabType,
    ));
  }
}

/// @nodoc

class _$AppNavigationStateImpl implements _AppNavigationState {
  const _$AppNavigationStateImpl(
      {this.selectedBottomNavItem = NavItem.home,
      this.selectedTradesTab = MarketTabType.spot});

  @override
  @JsonKey()
  final NavItem selectedBottomNavItem;
  @override
  @JsonKey()
  final MarketTabType selectedTradesTab;

  @override
  String toString() {
    return 'AppNavigationState(selectedBottomNavItem: $selectedBottomNavItem, selectedTradesTab: $selectedTradesTab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppNavigationStateImpl &&
            (identical(other.selectedBottomNavItem, selectedBottomNavItem) ||
                other.selectedBottomNavItem == selectedBottomNavItem) &&
            (identical(other.selectedTradesTab, selectedTradesTab) ||
                other.selectedTradesTab == selectedTradesTab));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedBottomNavItem, selectedTradesTab);

  /// Create a copy of AppNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppNavigationStateImplCopyWith<_$AppNavigationStateImpl> get copyWith =>
      __$$AppNavigationStateImplCopyWithImpl<_$AppNavigationStateImpl>(
          this, _$identity);
}

abstract class _AppNavigationState implements AppNavigationState {
  const factory _AppNavigationState(
      {final NavItem selectedBottomNavItem,
      final MarketTabType selectedTradesTab}) = _$AppNavigationStateImpl;

  @override
  NavItem get selectedBottomNavItem;
  @override
  MarketTabType get selectedTradesTab;

  /// Create a copy of AppNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppNavigationStateImplCopyWith<_$AppNavigationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
