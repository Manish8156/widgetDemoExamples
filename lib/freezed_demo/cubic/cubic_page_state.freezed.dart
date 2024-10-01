// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cubic_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://.github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CubicPageState {
  ViewState get cubicStates => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Create a copy of CubicPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CubicPageStateCopyWith<CubicPageState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CubicPageStateCopyWith<$Res> {
  factory $CubicPageStateCopyWith(CubicPageState value, $Res Function(CubicPageState) then) =
      _$CubicPageStateCopyWithImpl<$Res, CubicPageState>;
  @useResult
  $Res call({ViewState cubicStates, int value});
}

/// @nodoc
class _$CubicPageStateCopyWithImpl<$Res, $Val extends CubicPageState> implements $CubicPageStateCopyWith<$Res> {
  _$CubicPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CubicPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cubicStates = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      cubicStates: null == cubicStates
          ? _value.cubicStates
          : cubicStates // ignore: cast_nullable_to_non_nullable
              as ViewState,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CubicPageStateImplCopyWith<$Res> implements $CubicPageStateCopyWith<$Res> {
  factory _$$CubicPageStateImplCopyWith(_$CubicPageStateImpl value, $Res Function(_$CubicPageStateImpl) then) =
      __$$CubicPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ViewState cubicStates, int value});
}

/// @nodoc
class __$$CubicPageStateImplCopyWithImpl<$Res> extends _$CubicPageStateCopyWithImpl<$Res, _$CubicPageStateImpl>
    implements _$$CubicPageStateImplCopyWith<$Res> {
  __$$CubicPageStateImplCopyWithImpl(_$CubicPageStateImpl _value, $Res Function(_$CubicPageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CubicPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cubicStates = null,
    Object? value = null,
  }) {
    return _then(_$CubicPageStateImpl(
      cubicStates: null == cubicStates
          ? _value.cubicStates
          : cubicStates // ignore: cast_nullable_to_non_nullable
              as ViewState,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CubicPageStateImpl implements _CubicPageState {
  const _$CubicPageStateImpl({this.cubicStates = ViewState.initial, this.value = 0});

  @override
  @JsonKey()
  final ViewState cubicStates;
  @override
  @JsonKey()
  final int value;

  @override
  String toString() {
    return 'CubicPageState(cubicStates: $cubicStates, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CubicPageStateImpl &&
            (identical(other.cubicStates, cubicStates) || other.cubicStates == cubicStates) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cubicStates, value);

  /// Create a copy of CubicPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CubicPageStateImplCopyWith<_$CubicPageStateImpl> get copyWith =>
      __$$CubicPageStateImplCopyWithImpl<_$CubicPageStateImpl>(this, _$identity);
}

abstract class _CubicPageState implements CubicPageState {
  const factory _CubicPageState({final ViewState cubicStates, final int value}) = _$CubicPageStateImpl;

  @override
  ViewState get cubicStates;
  @override
  int get value;

  /// Create a copy of CubicPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CubicPageStateImplCopyWith<_$CubicPageStateImpl> get copyWith => throw _privateConstructorUsedError;
}
