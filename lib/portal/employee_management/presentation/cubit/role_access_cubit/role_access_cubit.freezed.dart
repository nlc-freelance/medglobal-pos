// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_access_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoleAccessState {
  EmployeeRole? get role => throw _privateConstructorUsedError;
  Map<SystemAccess, bool> get systemAccess =>
      throw _privateConstructorUsedError;
  List<AccessControlModel> get accessControls =>
      throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoleAccessStateCopyWith<RoleAccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleAccessStateCopyWith<$Res> {
  factory $RoleAccessStateCopyWith(
          RoleAccessState value, $Res Function(RoleAccessState) then) =
      _$RoleAccessStateCopyWithImpl<$Res, RoleAccessState>;
  @useResult
  $Res call(
      {EmployeeRole? role,
      Map<SystemAccess, bool> systemAccess,
      List<AccessControlModel> accessControls,
      bool isFormValid});
}

/// @nodoc
class _$RoleAccessStateCopyWithImpl<$Res, $Val extends RoleAccessState>
    implements $RoleAccessStateCopyWith<$Res> {
  _$RoleAccessStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? systemAccess = null,
    Object? accessControls = null,
    Object? isFormValid = null,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as EmployeeRole?,
      systemAccess: null == systemAccess
          ? _value.systemAccess
          : systemAccess // ignore: cast_nullable_to_non_nullable
              as Map<SystemAccess, bool>,
      accessControls: null == accessControls
          ? _value.accessControls
          : accessControls // ignore: cast_nullable_to_non_nullable
              as List<AccessControlModel>,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleAccessStateImplCopyWith<$Res>
    implements $RoleAccessStateCopyWith<$Res> {
  factory _$$RoleAccessStateImplCopyWith(_$RoleAccessStateImpl value,
          $Res Function(_$RoleAccessStateImpl) then) =
      __$$RoleAccessStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmployeeRole? role,
      Map<SystemAccess, bool> systemAccess,
      List<AccessControlModel> accessControls,
      bool isFormValid});
}

/// @nodoc
class __$$RoleAccessStateImplCopyWithImpl<$Res>
    extends _$RoleAccessStateCopyWithImpl<$Res, _$RoleAccessStateImpl>
    implements _$$RoleAccessStateImplCopyWith<$Res> {
  __$$RoleAccessStateImplCopyWithImpl(
      _$RoleAccessStateImpl _value, $Res Function(_$RoleAccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? systemAccess = null,
    Object? accessControls = null,
    Object? isFormValid = null,
  }) {
    return _then(_$RoleAccessStateImpl(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as EmployeeRole?,
      systemAccess: null == systemAccess
          ? _value._systemAccess
          : systemAccess // ignore: cast_nullable_to_non_nullable
              as Map<SystemAccess, bool>,
      accessControls: null == accessControls
          ? _value._accessControls
          : accessControls // ignore: cast_nullable_to_non_nullable
              as List<AccessControlModel>,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RoleAccessStateImpl extends _RoleAccessState {
  const _$RoleAccessStateImpl(
      {this.role,
      final Map<SystemAccess, bool> systemAccess = const {},
      final List<AccessControlModel> accessControls = const [],
      this.isFormValid = true})
      : _systemAccess = systemAccess,
        _accessControls = accessControls,
        super._();

  @override
  final EmployeeRole? role;
  final Map<SystemAccess, bool> _systemAccess;
  @override
  @JsonKey()
  Map<SystemAccess, bool> get systemAccess {
    if (_systemAccess is EqualUnmodifiableMapView) return _systemAccess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_systemAccess);
  }

  final List<AccessControlModel> _accessControls;
  @override
  @JsonKey()
  List<AccessControlModel> get accessControls {
    if (_accessControls is EqualUnmodifiableListView) return _accessControls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accessControls);
  }

  @override
  @JsonKey()
  final bool isFormValid;

  @override
  String toString() {
    return 'RoleAccessState(role: $role, systemAccess: $systemAccess, accessControls: $accessControls, isFormValid: $isFormValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleAccessStateImpl &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality()
                .equals(other._systemAccess, _systemAccess) &&
            const DeepCollectionEquality()
                .equals(other._accessControls, _accessControls) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      role,
      const DeepCollectionEquality().hash(_systemAccess),
      const DeepCollectionEquality().hash(_accessControls),
      isFormValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleAccessStateImplCopyWith<_$RoleAccessStateImpl> get copyWith =>
      __$$RoleAccessStateImplCopyWithImpl<_$RoleAccessStateImpl>(
          this, _$identity);
}

abstract class _RoleAccessState extends RoleAccessState {
  const factory _RoleAccessState(
      {final EmployeeRole? role,
      final Map<SystemAccess, bool> systemAccess,
      final List<AccessControlModel> accessControls,
      final bool isFormValid}) = _$RoleAccessStateImpl;
  const _RoleAccessState._() : super._();

  @override
  EmployeeRole? get role;
  @override
  Map<SystemAccess, bool> get systemAccess;
  @override
  List<AccessControlModel> get accessControls;
  @override
  bool get isFormValid;
  @override
  @JsonKey(ignore: true)
  _$$RoleAccessStateImplCopyWith<_$RoleAccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
