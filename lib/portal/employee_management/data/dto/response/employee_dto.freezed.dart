// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmployeeDto _$EmployeeDtoFromJson(Map<String, dynamic> json) {
  return _EmployeeDto.fromJson(json);
}

/// @nodoc
mixin _$EmployeeDto {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  List<BranchPartialDto> get assignedStores =>
      throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  List<String> get systemAccess => throw _privateConstructorUsedError;
  List<AccessControlDto> get accessControls =>
      throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeDtoCopyWith<EmployeeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeDtoCopyWith<$Res> {
  factory $EmployeeDtoCopyWith(
          EmployeeDto value, $Res Function(EmployeeDto) then) =
      _$EmployeeDtoCopyWithImpl<$Res, EmployeeDto>;
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String email,
      String phone,
      List<BranchPartialDto> assignedStores,
      String role,
      List<String> systemAccess,
      List<AccessControlDto> accessControls,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class _$EmployeeDtoCopyWithImpl<$Res, $Val extends EmployeeDto>
    implements $EmployeeDtoCopyWith<$Res> {
  _$EmployeeDtoCopyWithImpl(this._value, this._then);

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
    Object? email = null,
    Object? phone = null,
    Object? assignedStores = null,
    Object? role = null,
    Object? systemAccess = null,
    Object? accessControls = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      assignedStores: null == assignedStores
          ? _value.assignedStores
          : assignedStores // ignore: cast_nullable_to_non_nullable
              as List<BranchPartialDto>,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      systemAccess: null == systemAccess
          ? _value.systemAccess
          : systemAccess // ignore: cast_nullable_to_non_nullable
              as List<String>,
      accessControls: null == accessControls
          ? _value.accessControls
          : accessControls // ignore: cast_nullable_to_non_nullable
              as List<AccessControlDto>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeDtoImplCopyWith<$Res>
    implements $EmployeeDtoCopyWith<$Res> {
  factory _$$EmployeeDtoImplCopyWith(
          _$EmployeeDtoImpl value, $Res Function(_$EmployeeDtoImpl) then) =
      __$$EmployeeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String email,
      String phone,
      List<BranchPartialDto> assignedStores,
      String role,
      List<String> systemAccess,
      List<AccessControlDto> accessControls,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$EmployeeDtoImplCopyWithImpl<$Res>
    extends _$EmployeeDtoCopyWithImpl<$Res, _$EmployeeDtoImpl>
    implements _$$EmployeeDtoImplCopyWith<$Res> {
  __$$EmployeeDtoImplCopyWithImpl(
      _$EmployeeDtoImpl _value, $Res Function(_$EmployeeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? assignedStores = null,
    Object? role = null,
    Object? systemAccess = null,
    Object? accessControls = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EmployeeDtoImpl(
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      assignedStores: null == assignedStores
          ? _value._assignedStores
          : assignedStores // ignore: cast_nullable_to_non_nullable
              as List<BranchPartialDto>,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      systemAccess: null == systemAccess
          ? _value._systemAccess
          : systemAccess // ignore: cast_nullable_to_non_nullable
              as List<String>,
      accessControls: null == accessControls
          ? _value._accessControls
          : accessControls // ignore: cast_nullable_to_non_nullable
              as List<AccessControlDto>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeDtoImpl extends _EmployeeDto {
  const _$EmployeeDtoImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required final List<BranchPartialDto> assignedStores,
      required this.role,
      required final List<String> systemAccess,
      required final List<AccessControlDto> accessControls,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt})
      : _assignedStores = assignedStores,
        _systemAccess = systemAccess,
        _accessControls = accessControls,
        super._();

  factory _$EmployeeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String phone;
  final List<BranchPartialDto> _assignedStores;
  @override
  List<BranchPartialDto> get assignedStores {
    if (_assignedStores is EqualUnmodifiableListView) return _assignedStores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedStores);
  }

  @override
  final String role;
  final List<String> _systemAccess;
  @override
  List<String> get systemAccess {
    if (_systemAccess is EqualUnmodifiableListView) return _systemAccess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_systemAccess);
  }

  final List<AccessControlDto> _accessControls;
  @override
  List<AccessControlDto> get accessControls {
    if (_accessControls is EqualUnmodifiableListView) return _accessControls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accessControls);
  }

  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'EmployeeDto(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, assignedStores: $assignedStores, role: $role, systemAccess: $systemAccess, accessControls: $accessControls, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other._assignedStores, _assignedStores) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality()
                .equals(other._systemAccess, _systemAccess) &&
            const DeepCollectionEquality()
                .equals(other._accessControls, _accessControls) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      email,
      phone,
      const DeepCollectionEquality().hash(_assignedStores),
      role,
      const DeepCollectionEquality().hash(_systemAccess),
      const DeepCollectionEquality().hash(_accessControls),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeDtoImplCopyWith<_$EmployeeDtoImpl> get copyWith =>
      __$$EmployeeDtoImplCopyWithImpl<_$EmployeeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeDtoImplToJson(
      this,
    );
  }
}

abstract class _EmployeeDto extends EmployeeDto {
  const factory _EmployeeDto(
      {required final int id,
      required final String firstName,
      required final String lastName,
      required final String email,
      required final String phone,
      required final List<BranchPartialDto> assignedStores,
      required final String role,
      required final List<String> systemAccess,
      required final List<AccessControlDto> accessControls,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt}) = _$EmployeeDtoImpl;
  const _EmployeeDto._() : super._();

  factory _EmployeeDto.fromJson(Map<String, dynamic> json) =
      _$EmployeeDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get phone;
  @override
  List<BranchPartialDto> get assignedStores;
  @override
  String get role;
  @override
  List<String> get systemAccess;
  @override
  List<AccessControlDto> get accessControls;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeDtoImplCopyWith<_$EmployeeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
