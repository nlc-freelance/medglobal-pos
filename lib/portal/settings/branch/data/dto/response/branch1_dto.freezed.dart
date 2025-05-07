// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch1_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Branch1Dto _$Branch1DtoFromJson(Map<String, dynamic> json) {
  return _Branch1Dto.fromJson(json);
}

/// @nodoc
mixin _$Branch1Dto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Branch1DtoCopyWith<Branch1Dto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Branch1DtoCopyWith<$Res> {
  factory $Branch1DtoCopyWith(
          Branch1Dto value, $Res Function(Branch1Dto) then) =
      _$Branch1DtoCopyWithImpl<$Res, Branch1Dto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String address,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class _$Branch1DtoCopyWithImpl<$Res, $Val extends Branch1Dto>
    implements $Branch1DtoCopyWith<$Res> {
  _$Branch1DtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$Branch1DtoImplCopyWith<$Res>
    implements $Branch1DtoCopyWith<$Res> {
  factory _$$Branch1DtoImplCopyWith(
          _$Branch1DtoImpl value, $Res Function(_$Branch1DtoImpl) then) =
      __$$Branch1DtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String address,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$Branch1DtoImplCopyWithImpl<$Res>
    extends _$Branch1DtoCopyWithImpl<$Res, _$Branch1DtoImpl>
    implements _$$Branch1DtoImplCopyWith<$Res> {
  __$$Branch1DtoImplCopyWithImpl(
      _$Branch1DtoImpl _value, $Res Function(_$Branch1DtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$Branch1DtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$Branch1DtoImpl implements _Branch1Dto {
  const _$Branch1DtoImpl(
      {required this.id,
      required this.name,
      required this.address,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt});

  factory _$Branch1DtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$Branch1DtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String address;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Branch1Dto(id: $id, name: $name, address: $address, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Branch1DtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, address, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Branch1DtoImplCopyWith<_$Branch1DtoImpl> get copyWith =>
      __$$Branch1DtoImplCopyWithImpl<_$Branch1DtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Branch1DtoImplToJson(
      this,
    );
  }
}

abstract class _Branch1Dto implements Branch1Dto {
  const factory _Branch1Dto(
      {required final int id,
      required final String name,
      required final String address,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt}) = _$Branch1DtoImpl;

  factory _Branch1Dto.fromJson(Map<String, dynamic> json) =
      _$Branch1DtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get address;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$Branch1DtoImplCopyWith<_$Branch1DtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
