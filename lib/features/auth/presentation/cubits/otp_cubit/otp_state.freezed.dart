// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OtpState {
  SendOtpStatus get sendStatus => throw _privateConstructorUsedError;
  VerifOtpStatus get verifStatus => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  String? get sendError => throw _privateConstructorUsedError;
  String? get verifyError => throw _privateConstructorUsedError;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpStateCopyWith<OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
  @useResult
  $Res call({
    SendOtpStatus sendStatus,
    VerifOtpStatus verifStatus,
    String? verificationId,
    String? sendError,
    String? verifyError,
  });
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendStatus = null,
    Object? verifStatus = null,
    Object? verificationId = freezed,
    Object? sendError = freezed,
    Object? verifyError = freezed,
  }) {
    return _then(
      _value.copyWith(
            sendStatus: null == sendStatus
                ? _value.sendStatus
                : sendStatus // ignore: cast_nullable_to_non_nullable
                      as SendOtpStatus,
            verifStatus: null == verifStatus
                ? _value.verifStatus
                : verifStatus // ignore: cast_nullable_to_non_nullable
                      as VerifOtpStatus,
            verificationId: freezed == verificationId
                ? _value.verificationId
                : verificationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            sendError: freezed == sendError
                ? _value.sendError
                : sendError // ignore: cast_nullable_to_non_nullable
                      as String?,
            verifyError: freezed == verifyError
                ? _value.verifyError
                : verifyError // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OtpStateImplCopyWith<$Res>
    implements $OtpStateCopyWith<$Res> {
  factory _$$OtpStateImplCopyWith(
    _$OtpStateImpl value,
    $Res Function(_$OtpStateImpl) then,
  ) = __$$OtpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SendOtpStatus sendStatus,
    VerifOtpStatus verifStatus,
    String? verificationId,
    String? sendError,
    String? verifyError,
  });
}

/// @nodoc
class __$$OtpStateImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$OtpStateImpl>
    implements _$$OtpStateImplCopyWith<$Res> {
  __$$OtpStateImplCopyWithImpl(
    _$OtpStateImpl _value,
    $Res Function(_$OtpStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendStatus = null,
    Object? verifStatus = null,
    Object? verificationId = freezed,
    Object? sendError = freezed,
    Object? verifyError = freezed,
  }) {
    return _then(
      _$OtpStateImpl(
        sendStatus: null == sendStatus
            ? _value.sendStatus
            : sendStatus // ignore: cast_nullable_to_non_nullable
                  as SendOtpStatus,
        verifStatus: null == verifStatus
            ? _value.verifStatus
            : verifStatus // ignore: cast_nullable_to_non_nullable
                  as VerifOtpStatus,
        verificationId: freezed == verificationId
            ? _value.verificationId
            : verificationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sendError: freezed == sendError
            ? _value.sendError
            : sendError // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifyError: freezed == verifyError
            ? _value.verifyError
            : verifyError // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OtpStateImpl implements _OtpState {
  const _$OtpStateImpl({
    this.sendStatus = SendOtpStatus.initial,
    this.verifStatus = VerifOtpStatus.initial,
    this.verificationId,
    this.sendError,
    this.verifyError,
  });

  @override
  @JsonKey()
  final SendOtpStatus sendStatus;
  @override
  @JsonKey()
  final VerifOtpStatus verifStatus;
  @override
  final String? verificationId;
  @override
  final String? sendError;
  @override
  final String? verifyError;

  @override
  String toString() {
    return 'OtpState(sendStatus: $sendStatus, verifStatus: $verifStatus, verificationId: $verificationId, sendError: $sendError, verifyError: $verifyError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpStateImpl &&
            (identical(other.sendStatus, sendStatus) ||
                other.sendStatus == sendStatus) &&
            (identical(other.verifStatus, verifStatus) ||
                other.verifStatus == verifStatus) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.sendError, sendError) ||
                other.sendError == sendError) &&
            (identical(other.verifyError, verifyError) ||
                other.verifyError == verifyError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sendStatus,
    verifStatus,
    verificationId,
    sendError,
    verifyError,
  );

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      __$$OtpStateImplCopyWithImpl<_$OtpStateImpl>(this, _$identity);
}

abstract class _OtpState implements OtpState {
  const factory _OtpState({
    final SendOtpStatus sendStatus,
    final VerifOtpStatus verifStatus,
    final String? verificationId,
    final String? sendError,
    final String? verifyError,
  }) = _$OtpStateImpl;

  @override
  SendOtpStatus get sendStatus;
  @override
  VerifOtpStatus get verifStatus;
  @override
  String? get verificationId;
  @override
  String? get sendError;
  @override
  String? get verifyError;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
