// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Register _$RegisterFromJson(Map<String, dynamic> json) {
  return _Register.fromJson(json);
}

/// @nodoc
mixin _$Register {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Branch get assignedBranch => throw _privateConstructorUsedError;
  RegisterShift? get shiftDetail => throw _privateConstructorUsedError;
  String? get serialNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterCopyWith<Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) then) =
      _$RegisterCopyWithImpl<$Res, Register>;
  @useResult
  $Res call(
      {int? id,
      String name,
      Branch assignedBranch,
      RegisterShift? shiftDetail,
      String? serialNumber});

  $BranchCopyWith<$Res> get assignedBranch;
}

/// @nodoc
class _$RegisterCopyWithImpl<$Res, $Val extends Register>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? assignedBranch = null,
    Object? shiftDetail = freezed,
    Object? serialNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assignedBranch: null == assignedBranch
          ? _value.assignedBranch
          : assignedBranch // ignore: cast_nullable_to_non_nullable
              as Branch,
      shiftDetail: freezed == shiftDetail
          ? _value.shiftDetail
          : shiftDetail // ignore: cast_nullable_to_non_nullable
              as RegisterShift?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res> get assignedBranch {
    return $BranchCopyWith<$Res>(_value.assignedBranch, (value) {
      return _then(_value.copyWith(assignedBranch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterImplCopyWith<$Res>
    implements $RegisterCopyWith<$Res> {
  factory _$$RegisterImplCopyWith(
          _$RegisterImpl value, $Res Function(_$RegisterImpl) then) =
      __$$RegisterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      Branch assignedBranch,
      RegisterShift? shiftDetail,
      String? serialNumber});

  @override
  $BranchCopyWith<$Res> get assignedBranch;
}

/// @nodoc
class __$$RegisterImplCopyWithImpl<$Res>
    extends _$RegisterCopyWithImpl<$Res, _$RegisterImpl>
    implements _$$RegisterImplCopyWith<$Res> {
  __$$RegisterImplCopyWithImpl(
      _$RegisterImpl _value, $Res Function(_$RegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? assignedBranch = null,
    Object? shiftDetail = freezed,
    Object? serialNumber = freezed,
  }) {
    return _then(_$RegisterImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assignedBranch: null == assignedBranch
          ? _value.assignedBranch
          : assignedBranch // ignore: cast_nullable_to_non_nullable
              as Branch,
      shiftDetail: freezed == shiftDetail
          ? _value.shiftDetail
          : shiftDetail // ignore: cast_nullable_to_non_nullable
              as RegisterShift?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterImpl extends _Register {
  const _$RegisterImpl(
      {this.id,
      required this.name,
      required this.assignedBranch,
      this.shiftDetail,
      this.serialNumber})
      : super._();

  factory _$RegisterImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final Branch assignedBranch;
  @override
  final RegisterShift? shiftDetail;
  @override
  final String? serialNumber;

  @override
  String toString() {
    return 'Register(id: $id, name: $name, assignedBranch: $assignedBranch, shiftDetail: $shiftDetail, serialNumber: $serialNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assignedBranch, assignedBranch) ||
                other.assignedBranch == assignedBranch) &&
            (identical(other.shiftDetail, shiftDetail) ||
                other.shiftDetail == shiftDetail) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, assignedBranch, shiftDetail, serialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      __$$RegisterImplCopyWithImpl<_$RegisterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterImplToJson(
      this,
    );
  }
}

abstract class _Register extends Register {
  const factory _Register(
      {final int? id,
      required final String name,
      required final Branch assignedBranch,
      final RegisterShift? shiftDetail,
      final String? serialNumber}) = _$RegisterImpl;
  const _Register._() : super._();

  factory _Register.fromJson(Map<String, dynamic> json) =
      _$RegisterImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  Branch get assignedBranch;
  @override
  RegisterShift? get shiftDetail;
  @override
  String? get serialNumber;
  @override
  @JsonKey(ignore: true)
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
