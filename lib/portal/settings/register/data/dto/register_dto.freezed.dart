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

RegisterDto _$RegisterDtoFromJson(Map<String, dynamic> json) {
  return _RegisterDto.fromJson(json);
}

/// @nodoc
mixin _$RegisterDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  BranchDto? get store => throw _privateConstructorUsedError;
  RegisterShiftDetailDto? get shiftDetail => throw _privateConstructorUsedError;
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
      BranchDto? store,
      RegisterShiftDetailDto? shiftDetail,
      String? serialNumber,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});

  $BranchDtoCopyWith<$Res>? get store;
  $RegisterShiftDetailDtoCopyWith<$Res>? get shiftDetail;
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
              as BranchDto?,
      shiftDetail: freezed == shiftDetail
          ? _value.shiftDetail
          : shiftDetail // ignore: cast_nullable_to_non_nullable
              as RegisterShiftDetailDto?,
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
  $BranchDtoCopyWith<$Res>? get store {
    if (_value.store == null) {
      return null;
    }

    return $BranchDtoCopyWith<$Res>(_value.store!, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterShiftDetailDtoCopyWith<$Res>? get shiftDetail {
    if (_value.shiftDetail == null) {
      return null;
    }

    return $RegisterShiftDetailDtoCopyWith<$Res>(_value.shiftDetail!, (value) {
      return _then(_value.copyWith(shiftDetail: value) as $Val);
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
      BranchDto? store,
      RegisterShiftDetailDto? shiftDetail,
      String? serialNumber,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});

  @override
  $BranchDtoCopyWith<$Res>? get store;
  @override
  $RegisterShiftDetailDtoCopyWith<$Res>? get shiftDetail;
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
              as BranchDto?,
      shiftDetail: freezed == shiftDetail
          ? _value.shiftDetail
          : shiftDetail // ignore: cast_nullable_to_non_nullable
              as RegisterShiftDetailDto?,
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
class _$RegisterDtoImpl implements _RegisterDto {
  const _$RegisterDtoImpl(
      {required this.id,
      required this.name,
      this.store,
      this.shiftDetail,
      this.serialNumber,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt});

  factory _$RegisterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final BranchDto? store;
  @override
  final RegisterShiftDetailDto? shiftDetail;
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

abstract class _RegisterDto implements RegisterDto {
  const factory _RegisterDto(
      {required final int id,
      required final String name,
      final BranchDto? store,
      final RegisterShiftDetailDto? shiftDetail,
      final String? serialNumber,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt}) = _$RegisterDtoImpl;

  factory _RegisterDto.fromJson(Map<String, dynamic> json) =
      _$RegisterDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  BranchDto? get store;
  @override
  RegisterShiftDetailDto? get shiftDetail;
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

RegisterPartialDto _$RegisterPartialDtoFromJson(Map<String, dynamic> json) {
  return _RegisterPartialDto.fromJson(json);
}

/// @nodoc
mixin _$RegisterPartialDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get serialNumber => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterPartialDtoCopyWith<RegisterPartialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPartialDtoCopyWith<$Res> {
  factory $RegisterPartialDtoCopyWith(
          RegisterPartialDto value, $Res Function(RegisterPartialDto) then) =
      _$RegisterPartialDtoCopyWithImpl<$Res, RegisterPartialDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? serialNumber,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class _$RegisterPartialDtoCopyWithImpl<$Res, $Val extends RegisterPartialDto>
    implements $RegisterPartialDtoCopyWith<$Res> {
  _$RegisterPartialDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
}

/// @nodoc
abstract class _$$RegisterPartialDtoImplCopyWith<$Res>
    implements $RegisterPartialDtoCopyWith<$Res> {
  factory _$$RegisterPartialDtoImplCopyWith(_$RegisterPartialDtoImpl value,
          $Res Function(_$RegisterPartialDtoImpl) then) =
      __$$RegisterPartialDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? serialNumber,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$RegisterPartialDtoImplCopyWithImpl<$Res>
    extends _$RegisterPartialDtoCopyWithImpl<$Res, _$RegisterPartialDtoImpl>
    implements _$$RegisterPartialDtoImplCopyWith<$Res> {
  __$$RegisterPartialDtoImplCopyWithImpl(_$RegisterPartialDtoImpl _value,
      $Res Function(_$RegisterPartialDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? serialNumber = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$RegisterPartialDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$RegisterPartialDtoImpl implements _RegisterPartialDto {
  const _$RegisterPartialDtoImpl(
      {required this.id,
      required this.name,
      this.serialNumber,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt});

  factory _$RegisterPartialDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterPartialDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
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
    return 'RegisterPartialDto(id: $id, name: $name, serialNumber: $serialNumber, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPartialDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, serialNumber, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPartialDtoImplCopyWith<_$RegisterPartialDtoImpl> get copyWith =>
      __$$RegisterPartialDtoImplCopyWithImpl<_$RegisterPartialDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterPartialDtoImplToJson(
      this,
    );
  }
}

abstract class _RegisterPartialDto implements RegisterPartialDto {
  const factory _RegisterPartialDto(
          {required final int id,
          required final String name,
          final String? serialNumber,
          @DateTimeConverter() final DateTime? createdAt,
          @DateTimeConverter() final DateTime? updatedAt}) =
      _$RegisterPartialDtoImpl;

  factory _RegisterPartialDto.fromJson(Map<String, dynamic> json) =
      _$RegisterPartialDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
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
  _$$RegisterPartialDtoImplCopyWith<_$RegisterPartialDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
