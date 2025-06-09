// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterLiteDto _$RegisterLiteDtoFromJson(Map<String, dynamic> json) {
  return _RegisterLiteDto.fromJson(json);
}

/// @nodoc
mixin _$RegisterLiteDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterLiteDtoCopyWith<RegisterLiteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterLiteDtoCopyWith<$Res> {
  factory $RegisterLiteDtoCopyWith(
          RegisterLiteDto value, $Res Function(RegisterLiteDto) then) =
      _$RegisterLiteDtoCopyWithImpl<$Res, RegisterLiteDto>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$RegisterLiteDtoCopyWithImpl<$Res, $Val extends RegisterLiteDto>
    implements $RegisterLiteDtoCopyWith<$Res> {
  _$RegisterLiteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterLiteDtoImplCopyWith<$Res>
    implements $RegisterLiteDtoCopyWith<$Res> {
  factory _$$RegisterLiteDtoImplCopyWith(_$RegisterLiteDtoImpl value,
          $Res Function(_$RegisterLiteDtoImpl) then) =
      __$$RegisterLiteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$RegisterLiteDtoImplCopyWithImpl<$Res>
    extends _$RegisterLiteDtoCopyWithImpl<$Res, _$RegisterLiteDtoImpl>
    implements _$$RegisterLiteDtoImplCopyWith<$Res> {
  __$$RegisterLiteDtoImplCopyWithImpl(
      _$RegisterLiteDtoImpl _value, $Res Function(_$RegisterLiteDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$RegisterLiteDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterLiteDtoImpl extends _RegisterLiteDto {
  const _$RegisterLiteDtoImpl({required this.id, required this.name})
      : super._();

  factory _$RegisterLiteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterLiteDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'RegisterLiteDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLiteDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterLiteDtoImplCopyWith<_$RegisterLiteDtoImpl> get copyWith =>
      __$$RegisterLiteDtoImplCopyWithImpl<_$RegisterLiteDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterLiteDtoImplToJson(
      this,
    );
  }
}

abstract class _RegisterLiteDto extends RegisterLiteDto {
  const factory _RegisterLiteDto(
      {required final int id,
      required final String name}) = _$RegisterLiteDtoImpl;
  const _RegisterLiteDto._() : super._();

  factory _RegisterLiteDto.fromJson(Map<String, dynamic> json) =
      _$RegisterLiteDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RegisterLiteDtoImplCopyWith<_$RegisterLiteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterDto _$RegisterDtoFromJson(Map<String, dynamic> json) {
  return _RegisterDto.fromJson(json);
}

/// @nodoc
mixin _$RegisterDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  BranchLiteDto? get store =>
      throw _privateConstructorUsedError; // BranchDto? store,
  RegisterShiftDto? get shiftDetail => throw _privateConstructorUsedError;
  String? get serialNumber => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterDtoCopyWith<RegisterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterDtoCopyWith<$Res> {
  factory $RegisterDtoCopyWith(
          RegisterDto value, $Res Function(RegisterDto) then) =
      _$RegisterDtoCopyWithImpl<$Res, RegisterDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      BranchLiteDto? store,
      RegisterShiftDto? shiftDetail,
      String? serialNumber,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});

  $BranchLiteDtoCopyWith<$Res>? get store;
}

/// @nodoc
class _$RegisterDtoCopyWithImpl<$Res, $Val extends RegisterDto>
    implements $RegisterDtoCopyWith<$Res> {
  _$RegisterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? store = freezed,
    Object? shiftDetail = freezed,
    Object? serialNumber = freezed,
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
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as BranchLiteDto?,
      shiftDetail: freezed == shiftDetail
          ? _value.shiftDetail
          : shiftDetail // ignore: cast_nullable_to_non_nullable
              as RegisterShiftDto?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
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

  @override
  @pragma('vm:prefer-inline')
  $BranchLiteDtoCopyWith<$Res>? get store {
    if (_value.store == null) {
      return null;
    }

    return $BranchLiteDtoCopyWith<$Res>(_value.store!, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterDtoImplCopyWith<$Res>
    implements $RegisterDtoCopyWith<$Res> {
  factory _$$RegisterDtoImplCopyWith(
          _$RegisterDtoImpl value, $Res Function(_$RegisterDtoImpl) then) =
      __$$RegisterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      BranchLiteDto? store,
      RegisterShiftDto? shiftDetail,
      String? serialNumber,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});

  @override
  $BranchLiteDtoCopyWith<$Res>? get store;
}

/// @nodoc
class __$$RegisterDtoImplCopyWithImpl<$Res>
    extends _$RegisterDtoCopyWithImpl<$Res, _$RegisterDtoImpl>
    implements _$$RegisterDtoImplCopyWith<$Res> {
  __$$RegisterDtoImplCopyWithImpl(
      _$RegisterDtoImpl _value, $Res Function(_$RegisterDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? store = freezed,
    Object? shiftDetail = freezed,
    Object? serialNumber = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$RegisterDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as BranchLiteDto?,
      shiftDetail: freezed == shiftDetail
          ? _value.shiftDetail
          : shiftDetail // ignore: cast_nullable_to_non_nullable
              as RegisterShiftDto?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$RegisterDtoImpl extends _RegisterDto {
  const _$RegisterDtoImpl(
      {required this.id,
      required this.name,
      this.store,
      this.shiftDetail,
      this.serialNumber,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt})
      : super._();

  factory _$RegisterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final BranchLiteDto? store;
// BranchDto? store,
  @override
  final RegisterShiftDto? shiftDetail;
  @override
  final String? serialNumber;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RegisterDto(id: $id, name: $name, store: $store, shiftDetail: $shiftDetail, serialNumber: $serialNumber, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.shiftDetail, shiftDetail) ||
                other.shiftDetail == shiftDetail) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, store, shiftDetail,
      serialNumber, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterDtoImplCopyWith<_$RegisterDtoImpl> get copyWith =>
      __$$RegisterDtoImplCopyWithImpl<_$RegisterDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterDtoImplToJson(
      this,
    );
  }
}

abstract class _RegisterDto extends RegisterDto {
  const factory _RegisterDto(
      {required final int id,
      required final String name,
      final BranchLiteDto? store,
      final RegisterShiftDto? shiftDetail,
      final String? serialNumber,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt}) = _$RegisterDtoImpl;
  const _RegisterDto._() : super._();

  factory _RegisterDto.fromJson(Map<String, dynamic> json) =
      _$RegisterDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  BranchLiteDto? get store;
  @override // BranchDto? store,
  RegisterShiftDto? get shiftDetail;
  @override
  String? get serialNumber;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RegisterDtoImplCopyWith<_$RegisterDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
