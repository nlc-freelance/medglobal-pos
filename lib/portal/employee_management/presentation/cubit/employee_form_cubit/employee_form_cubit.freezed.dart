// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmployeeFormState {
  int? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  List<Branch> get assignedBranches => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmployeeFormStateCopyWith<EmployeeFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeFormStateCopyWith<$Res> {
  factory $EmployeeFormStateCopyWith(
          EmployeeFormState value, $Res Function(EmployeeFormState) then) =
      _$EmployeeFormStateCopyWithImpl<$Res, EmployeeFormState>;
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      String? email,
      String? phone,
      List<Branch> assignedBranches});
}

/// @nodoc
class _$EmployeeFormStateCopyWithImpl<$Res, $Val extends EmployeeFormState>
    implements $EmployeeFormStateCopyWith<$Res> {
  _$EmployeeFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? assignedBranches = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBranches: null == assignedBranches
          ? _value.assignedBranches
          : assignedBranches // ignore: cast_nullable_to_non_nullable
              as List<Branch>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleAccessStateImplCopyWith<$Res>
    implements $EmployeeFormStateCopyWith<$Res> {
  factory _$$RoleAccessStateImplCopyWith(_$RoleAccessStateImpl value,
          $Res Function(_$RoleAccessStateImpl) then) =
      __$$RoleAccessStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      String? email,
      String? phone,
      List<Branch> assignedBranches});
}

/// @nodoc
class __$$RoleAccessStateImplCopyWithImpl<$Res>
    extends _$EmployeeFormStateCopyWithImpl<$Res, _$RoleAccessStateImpl>
    implements _$$RoleAccessStateImplCopyWith<$Res> {
  __$$RoleAccessStateImplCopyWithImpl(
      _$RoleAccessStateImpl _value, $Res Function(_$RoleAccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? assignedBranches = null,
  }) {
    return _then(_$RoleAccessStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBranches: null == assignedBranches
          ? _value._assignedBranches
          : assignedBranches // ignore: cast_nullable_to_non_nullable
              as List<Branch>,
    ));
  }
}

/// @nodoc

class _$RoleAccessStateImpl extends _RoleAccessState {
  const _$RoleAccessStateImpl(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      final List<Branch> assignedBranches = const []})
      : _assignedBranches = assignedBranches,
        super._();

  @override
  final int? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? phone;
  final List<Branch> _assignedBranches;
  @override
  @JsonKey()
  List<Branch> get assignedBranches {
    if (_assignedBranches is EqualUnmodifiableListView)
      return _assignedBranches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedBranches);
  }

  @override
  String toString() {
    return 'EmployeeFormState(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, assignedBranches: $assignedBranches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleAccessStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other._assignedBranches, _assignedBranches));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phone, const DeepCollectionEquality().hash(_assignedBranches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleAccessStateImplCopyWith<_$RoleAccessStateImpl> get copyWith =>
      __$$RoleAccessStateImplCopyWithImpl<_$RoleAccessStateImpl>(
          this, _$identity);
}

abstract class _RoleAccessState extends EmployeeFormState {
  const factory _RoleAccessState(
      {final int? id,
      final String? firstName,
      final String? lastName,
      final String? email,
      final String? phone,
      final List<Branch> assignedBranches}) = _$RoleAccessStateImpl;
  const _RoleAccessState._() : super._();

  @override
  int? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  List<Branch> get assignedBranches;
  @override
  @JsonKey(ignore: true)
  _$$RoleAccessStateImplCopyWith<_$RoleAccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
