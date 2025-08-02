// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Employee {
  int? get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  List<BranchPartial> get assignedBranches =>
      throw _privateConstructorUsedError;
  EmployeeRole get role => throw _privateConstructorUsedError;
  List<SystemAccess> get systemAccess => throw _privateConstructorUsedError;
  List<AccessControl> get accessControls => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res, Employee>;
  @useResult
  $Res call(
      {int? id,
      String firstName,
      String lastName,
      String email,
      String phone,
      List<BranchPartial> assignedBranches,
      EmployeeRole role,
      List<SystemAccess> systemAccess,
      List<AccessControl> accessControls});
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res, $Val extends Employee>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? assignedBranches = null,
    Object? role = null,
    Object? systemAccess = null,
    Object? accessControls = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      assignedBranches: null == assignedBranches
          ? _value.assignedBranches
          : assignedBranches // ignore: cast_nullable_to_non_nullable
              as List<BranchPartial>,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as EmployeeRole,
      systemAccess: null == systemAccess
          ? _value.systemAccess
          : systemAccess // ignore: cast_nullable_to_non_nullable
              as List<SystemAccess>,
      accessControls: null == accessControls
          ? _value.accessControls
          : accessControls // ignore: cast_nullable_to_non_nullable
              as List<AccessControl>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeImplCopyWith<$Res>
    implements $EmployeeCopyWith<$Res> {
  factory _$$EmployeeImplCopyWith(
          _$EmployeeImpl value, $Res Function(_$EmployeeImpl) then) =
      __$$EmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String firstName,
      String lastName,
      String email,
      String phone,
      List<BranchPartial> assignedBranches,
      EmployeeRole role,
      List<SystemAccess> systemAccess,
      List<AccessControl> accessControls});
}

/// @nodoc
class __$$EmployeeImplCopyWithImpl<$Res>
    extends _$EmployeeCopyWithImpl<$Res, _$EmployeeImpl>
    implements _$$EmployeeImplCopyWith<$Res> {
  __$$EmployeeImplCopyWithImpl(
      _$EmployeeImpl _value, $Res Function(_$EmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? assignedBranches = null,
    Object? role = null,
    Object? systemAccess = null,
    Object? accessControls = null,
  }) {
    return _then(_$EmployeeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      assignedBranches: null == assignedBranches
          ? _value._assignedBranches
          : assignedBranches // ignore: cast_nullable_to_non_nullable
              as List<BranchPartial>,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as EmployeeRole,
      systemAccess: null == systemAccess
          ? _value._systemAccess
          : systemAccess // ignore: cast_nullable_to_non_nullable
              as List<SystemAccess>,
      accessControls: null == accessControls
          ? _value._accessControls
          : accessControls // ignore: cast_nullable_to_non_nullable
              as List<AccessControl>,
    ));
  }
}

/// @nodoc

class _$EmployeeImpl extends _Employee {
  const _$EmployeeImpl(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required final List<BranchPartial> assignedBranches,
      required this.role,
      required final List<SystemAccess> systemAccess,
      required final List<AccessControl> accessControls})
      : _assignedBranches = assignedBranches,
        _systemAccess = systemAccess,
        _accessControls = accessControls,
        super._();

  @override
  final int? id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String phone;
  final List<BranchPartial> _assignedBranches;
  @override
  List<BranchPartial> get assignedBranches {
    if (_assignedBranches is EqualUnmodifiableListView)
      return _assignedBranches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedBranches);
  }

  @override
  final EmployeeRole role;
  final List<SystemAccess> _systemAccess;
  @override
  List<SystemAccess> get systemAccess {
    if (_systemAccess is EqualUnmodifiableListView) return _systemAccess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_systemAccess);
  }

  final List<AccessControl> _accessControls;
  @override
  List<AccessControl> get accessControls {
    if (_accessControls is EqualUnmodifiableListView) return _accessControls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accessControls);
  }

  @override
  String toString() {
    return 'Employee(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, assignedBranches: $assignedBranches, role: $role, systemAccess: $systemAccess, accessControls: $accessControls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other._assignedBranches, _assignedBranches) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality()
                .equals(other._systemAccess, _systemAccess) &&
            const DeepCollectionEquality()
                .equals(other._accessControls, _accessControls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      email,
      phone,
      const DeepCollectionEquality().hash(_assignedBranches),
      role,
      const DeepCollectionEquality().hash(_systemAccess),
      const DeepCollectionEquality().hash(_accessControls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      __$$EmployeeImplCopyWithImpl<_$EmployeeImpl>(this, _$identity);
}

abstract class _Employee extends Employee {
  const factory _Employee(
      {final int? id,
      required final String firstName,
      required final String lastName,
      required final String email,
      required final String phone,
      required final List<BranchPartial> assignedBranches,
      required final EmployeeRole role,
      required final List<SystemAccess> systemAccess,
      required final List<AccessControl> accessControls}) = _$EmployeeImpl;
  const _Employee._() : super._();

  @override
  int? get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get phone;
  @override
  List<BranchPartial> get assignedBranches;
  @override
  EmployeeRole get role;
  @override
  List<SystemAccess> get systemAccess;
  @override
  List<AccessControl> get accessControls;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeImplCopyWith<_$EmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmployeePartial {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmployeePartialCopyWith<EmployeePartial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeePartialCopyWith<$Res> {
  factory $EmployeePartialCopyWith(
          EmployeePartial value, $Res Function(EmployeePartial) then) =
      _$EmployeePartialCopyWithImpl<$Res, EmployeePartial>;
  @useResult
  $Res call({int id, String firstName, String lastName});
}

/// @nodoc
class _$EmployeePartialCopyWithImpl<$Res, $Val extends EmployeePartial>
    implements $EmployeePartialCopyWith<$Res> {
  _$EmployeePartialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeePartialImplCopyWith<$Res>
    implements $EmployeePartialCopyWith<$Res> {
  factory _$$EmployeePartialImplCopyWith(_$EmployeePartialImpl value,
          $Res Function(_$EmployeePartialImpl) then) =
      __$$EmployeePartialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String firstName, String lastName});
}

/// @nodoc
class __$$EmployeePartialImplCopyWithImpl<$Res>
    extends _$EmployeePartialCopyWithImpl<$Res, _$EmployeePartialImpl>
    implements _$$EmployeePartialImplCopyWith<$Res> {
  __$$EmployeePartialImplCopyWithImpl(
      _$EmployeePartialImpl _value, $Res Function(_$EmployeePartialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$EmployeePartialImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmployeePartialImpl implements _EmployeePartial {
  const _$EmployeePartialImpl(
      {required this.id, required this.firstName, required this.lastName});

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'EmployeePartial(id: $id, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeePartialImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeePartialImplCopyWith<_$EmployeePartialImpl> get copyWith =>
      __$$EmployeePartialImplCopyWithImpl<_$EmployeePartialImpl>(
          this, _$identity);
}

abstract class _EmployeePartial implements EmployeePartial {
  const factory _EmployeePartial(
      {required final int id,
      required final String firstName,
      required final String lastName}) = _$EmployeePartialImpl;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  @JsonKey(ignore: true)
  _$$EmployeePartialImplCopyWith<_$EmployeePartialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
