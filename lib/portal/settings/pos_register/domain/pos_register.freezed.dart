// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PosRegister {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Branch get assignedBranch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PosRegisterCopyWith<PosRegister> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosRegisterCopyWith<$Res> {
  factory $PosRegisterCopyWith(
          PosRegister value, $Res Function(PosRegister) then) =
      _$PosRegisterCopyWithImpl<$Res, PosRegister>;
  @useResult
  $Res call({int? id, String name, Branch assignedBranch});
}

/// @nodoc
class _$PosRegisterCopyWithImpl<$Res, $Val extends PosRegister>
    implements $PosRegisterCopyWith<$Res> {
  _$PosRegisterCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosRegisterImplCopyWith<$Res>
    implements $PosRegisterCopyWith<$Res> {
  factory _$$PosRegisterImplCopyWith(
          _$PosRegisterImpl value, $Res Function(_$PosRegisterImpl) then) =
      __$$PosRegisterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String name, Branch assignedBranch});
}

/// @nodoc
class __$$PosRegisterImplCopyWithImpl<$Res>
    extends _$PosRegisterCopyWithImpl<$Res, _$PosRegisterImpl>
    implements _$$PosRegisterImplCopyWith<$Res> {
  __$$PosRegisterImplCopyWithImpl(
      _$PosRegisterImpl _value, $Res Function(_$PosRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? assignedBranch = null,
  }) {
    return _then(_$PosRegisterImpl(
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
    ));
  }
}

/// @nodoc

class _$PosRegisterImpl extends _PosRegister {
  const _$PosRegisterImpl(
      {this.id, required this.name, required this.assignedBranch})
      : super._();

  @override
  final int? id;
  @override
  final String name;
  @override
  final Branch assignedBranch;

  @override
  String toString() {
    return 'PosRegister(id: $id, name: $name, assignedBranch: $assignedBranch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosRegisterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assignedBranch, assignedBranch) ||
                other.assignedBranch == assignedBranch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, assignedBranch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PosRegisterImplCopyWith<_$PosRegisterImpl> get copyWith =>
      __$$PosRegisterImplCopyWithImpl<_$PosRegisterImpl>(this, _$identity);
}

abstract class _PosRegister extends PosRegister {
  const factory _PosRegister(
      {final int? id,
      required final String name,
      required final Branch assignedBranch}) = _$PosRegisterImpl;
  const _PosRegister._() : super._();

  @override
  int? get id;
  @override
  String get name;
  @override
  Branch get assignedBranch;
  @override
  @JsonKey(ignore: true)
  _$$PosRegisterImplCopyWith<_$PosRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
